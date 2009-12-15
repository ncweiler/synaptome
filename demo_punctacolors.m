ds.vis = {};
ds.visname = {};

% vis = { 'Synapsin', 'Synapsin_puncta', ...
%     'Bassoon', 'Bassoon_puncta', ...
%     'VGlut1', 'VGlut1_puncta', ...
%     'VGlut2', 'VGlut2_puncta', ...
%     'PSD95', 'PSD95_puncta', ...
%     'VGat', 'VGat_puncta', ...
%     'GAD', 'GAD_puncta', ...
%     'Gephyrin', 'Gephyrin_puncta'
%     };

% vis = { 'Synapsin', 'Synapsin_puncta', 'WaterSeg',...
%     'Bassoon', 'Bassoon_assign', ...
%     'VGlut1', 'VGlut1_assign', ...
%     'VGlut2', 'VGlut2_assign', ...
%     'PSD95', 'PSD95_assign', ...
%     'VGat', 'VGat_assign', ...
%     'GAD', 'GAD_assign', ...
%     'Gephyrin', 'Gephyrin_assign'
%     };

vis = { 'Synapsin', 'Synapsin_puncta', 'WaterSeg',...
    'Bassoon', 'Bassoon_ab', ...
    'VGlut1', 'VGlut1_ab', ...
    'VGlut2', 'VGlut2_ab', ...
    'PSD95', 'PSD95_ab', ...
    'VGat', 'VGat_ab', ...
    'GAD', 'GAD_ab', ...
    'Gephyrin', 'Gephyrin_ab'
    };

vis = { 'Synapsin', 'Synapsin_puncta', 'WaterSeg', 'Synapsin_watermask', 'Synapsin_premask', 'Synapsin_postmask', ...
    };

vis = { 'Synapsin', 'Synapsin_puncta',  'Synapsin_premask', 'Synapsin_postmask',...
    'Bassoon', 'Bassoon_ab', ...
    'VGlut1', 'VGlut1_ab', ...
    'VGlut2', 'VGlut2_ab', ...
    'PSD95', 'PSD95_ab', ...
    'VGat', 'VGat_ab', ...
    'GAD', 'GAD_ab', ...
    'Gephyrin', 'Gephyrin_ab'
    };



% vis = { 'Synapsin',  ...
%     'Bassoon', ...
%     'VGlut1',  ...
%     'VGlut2',  ...
%     'PSD95',  ...
%     'VGat',  ...
%     'GAD',  ...
%     'Gephyrin' 
%     };
% 
% vis = {'Synapsin', 'Synapsin_th', 'Synapsin_max', 'Synapsin_labels', 'Synapsin_watermask', 'Synapsin_premask', 'Synapsin_postmask', 'VGlut1_th'};
% 
% vis = {'Synapsin', 'Synapsin_maxL', 'WaterSeg', 'Synapsin_puncta',...
%     'Bassoon_puncta',...
%   'VGlut1_puncta', ...
%   'VGlut2_puncta', ...
%     'PSD95_puncta', 'VGat_puncta', ...
%    'GAD_puncta', ...
%  'Gephyrin'};
% 
% vis = {'Synapsin', 'Synapsin_th', ...
%     'Bassoon', 'Bassoon_th', ...
%     'VGlut1', 'VGlut1_th', ...
%     'VGlut2', 'VGlut2_th', ...
%     'PSD95', 'PSD95_th', ...
%     'VGat', 'VGat_th', ...
%     'GAD', 'GAD_th', ...
%     'Gephyrin', 'Gephyrin_th' ...
%     };
% 
% vis = {'Synapsin', 'Synapsin_th', 'Synapsin_mw3', 'Synapsin_vormask'};
% 
% vis = {'Synapsin', 'Synapsin_th', 'Synapsin_mw3', 'Synapsin_vormask', 'Synapsin_maskpre', 'Synapsin_maskpost'};
% 
% vis = {'Synapsin_th', 'Synapsin_mw3', 'Synapsin_maskpre', 'Synapsin_maskpost',  ...
%     'Bassoon_th', 'Bassoon_ab', ...
%     'VGlut1_th', 'VGlut1_ab', ...
%     'VGlut2_th', 'VGlut2_ab', ...
%     'PSD95_th', 'PSD95_ab', ...
%     'VGat_th', 'VGat_ab', ...
%     'GAD_th', 'GAD_ab', ...
%     'Gephyrin_th', 'Gephyrin_ab' ...
%     };
% 
% vis = {'Synapsin_th', 'Synapsin_max', 'Synapsin_maxL'};
% 
% vis = {'Synapsin_th', 'Synapsin_max', 'WaterSeg', 'Synapsin_maxL', 'Synapsin_puncta'};


for i = 1:length(vis)
    ds = addvisrow(ds, vis{i});
end

viewsg(ds, 100);

%% Plot a 2D separability scatter plot
figure(1), clf;
feat = {'GABA_L2pre', 'Gephyrin_iab'};
synplot(ds, feat);

figure(2), clf;
feat = {'Glut_L2pre', 'PSD95_iab'};
synplot(ds, feat);



%% Plot a 2D separability scatter plot
figure(1), clf;
feat = {'VGlut1_iab', 'PSD95_iab'};
synplot(ds, feat);

figure(2), clf;
feat = {'VGlut2_iab', 'PSD95_iab'};
synplot(ds, feat);

figure(3), clf;
feat = {'GAD_iab', 'Gephyrin_iab'};
synplot(ds, feat);

figure(4), clf;
feat = {'VGat_iab', 'Gephyrin_iab'};
synplot(ds, feat);
