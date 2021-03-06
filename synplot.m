function synplot(ds, features, errors, twoclass)
% SYNPLOT(ds, features, errors, twoclass)
% 
% Displays a 2D scatter plot where each where each synapse is
% represented as a dot colored according to its human provided trainlabel. The
% two axes are specified by named features within ds.ft. 3D plots are
% not implemented but should be trivial if the need arises. Optionally, synapses
% which were misclassified by the most recently trained supervised learning
% classifier may be marked with an X. Clicking on a synapse dot in this plot
% will load a synaptogram visualization for that particular synapse. Only
% synapses marked with ds.trainactive(i) == 1 will be plotted.
% 
% features is an array of strings representing feature names to be used for
%   the X and Y axes. 
% errors is a binary vector indicating which synapses to
%   mark with an X, defaulting to zeros(ds.ntrain,1)
% twoclass is an array of label names used when the scatter plot should color synapses according to
%   only 2 categories, those whose label is in twoclass (as red) and all
%   others (as black)


if(~exist('features', 'var'))
    features = {'IB_VGlut1', 'IB_PSD95'};
end
if(~exist('errors', 'var'))
    errors = zeros(ds.ntrain,1);
else
    if(size(errors,1) ~= ds.ntrain)
        %errors = zeros(ds.ntrain,1);
        error('errors array should have length ds.ntrain');
    end
end
if(~exist('twoclass', 'var'))
    dotwoclass = 0;
else
    dotwoclass = 1;
    twocolors = {'r', 'k'};
    Y = zeros(ds.ntrain,1);
    catnames = '';
    for i = 1:length(twoclass)
        idx = find(strcmp(ds.labelnames, twoclass{i}));
        if(numel(idx) == 0)
            error('Could not find class %s', twoclass{i});
        end
        if(i == 1)
            catnames = strcat(twoclass{i},'');
        else
            catnames = strcat(catnames, ', ', twoclass{i});
        end
        Y = Y | (ds.trainlabel == idx(1));
    end
end 
    
t = sprintf('%s vs. %s', features{1}, features{2});
[ft idx] = getfeature(ds, features);
    
clf; hold on
% set(gcf, 'Position', [244   543   560   420]);
set(gcf, 'Name', t);
set(gcf, 'NumberTitle', 'off');
set(gcf, 'defaulttextinterpreter', 'none');

if(~dotwoclass)
    h = zeros(size(ds.labelnames));
    for ci = 1:length(ds.labelnames)
        h(ci) = line(0, 0, 'Marker', 'o', 'MarkerSize', 8, 'LineStyle', 'none', ...
            'MarkerFaceColor', ds.labelcolors(ci,:), ...
            'MarkerEdgeColor', ds.labelcolors(ci,:));
    end
    legend(ds.labelnames, 'Location', 'Best');
    delete(h);
else
    h = zeros(2,1);
    h(1) = line(0, 0, 'Marker', 'o', 'MarkerSize', 8, 'LineStyle', 'none', ...
        'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'r');
    h(2) = line(0, 0, 'Marker', 'o', 'MarkerSize', 8, 'LineStyle', 'none', ...
        'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'k');
    legend({catnames, 'Other'}, 'Location', 'Best');
    delete(h);
end



for i = 1:ds.ntrain
    if(~ds.trainactive(i))
        continue;
    end
       
    if(dotwoclass)
        color = twocolors{2-Y(i)};
    else      
        ci = ds.trainlabel(i);
        color = ds.labelcolors(ci,:);
    end
    
    % mark synapse as error?
    if(errors(i))
        h = line(ft(i,1), ft(i,2));
        set(h, 'Marker','x', 'LineStyle', 'none', ...
        'Color', color, ...
        'MarkerFaceColor', color, ...
        'MarkerEdgeColor', color, ...
        'MarkerSize', 15, ...
        'Tag', num2str(i));
    end
    
    h = line(ft(i, 1), ft(i, 2));
    set(h, 'Marker','o', 'LineStyle', 'none', ...
     'Color', color, ...
     'MarkerFaceColor', color, ...
     'MarkerEdgeColor', color, ...
     'MarkerSize', 4, ...
     'ButtonDownFcn', @callback, ...
     'Tag', num2str(i));
 
 
        
end
set(gcf, 'UserData', '');

xlabel(features{1});
ylabel(features{2});
title(t);

function callback(src, event)
   
tag = str2num(get(src,'Tag'));
x = get(src, 'XData');
y = get(src, 'YData');

hmark = get(gcf, 'UserData');
if(~strcmp(hmark, ''))
    delete(hmark);
end

hcurrent = plot(x,y, 'Marker', 'o', 'MarkerSize', 14, ...
    'MarkerFaceColor', 'none', 'MarkerEdgeColor', 'g');
set(gcf,'UserData', hcurrent);

viewsg(ds,tag, 99);

end

end