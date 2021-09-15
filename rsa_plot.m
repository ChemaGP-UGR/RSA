%% Initialize and configure plots:

graph = mvpalab_plotinit();

%% Load results if needed: 

load /Users/chema/Documents/Doctorado/AttExpLoc_EEG/Results/EEG/RSA/Loc_Cue/Exp_Loc/TR/result.mat

%% Mean accuracy plot (no statistical significance)

% Axis limits:
graph.xlim = [-100 1550];
graph.ylim = [-0.005 0.01];

% Axes labels and titles:
graph.xlabel = 'Time (ms)';
graph.ylabel = 'Classifier performance';
graph.title = 'Demo plot (no statistical significance)';

% Smooth results:
graph.smoothdata = 4; % (1 => no smoothing)

% Plot results:
% figure;
% hold on
% mvpalab_plotcr(graph,cfg,result);

%% Mean accuracy plot (statistical significance)

% Load results and and statistics if needed:
% load results/time_resolved/acc/result.mat

% Plot significant clusters (above and below chance):
graph.stats.above = false;
graph.stats.below = false;
graph.shadealpha = 0.3;
graph.shadecolor = graph.colors.earth{1};
% Significant indicator:
graph.sigh = -.002;
graph.sigc = graph.colors.earth{1};
% Title:
graph.title = 'Demo plot (statistical significance)';

% Plot results:
figure;
hold on
rsa_plotcr(graph,cfg,result);
hold on 
load  /Users/chema/Documents/Doctorado/AttExpLoc_EEG/Results/EEG/RSA/Loc_Cue/Att_Loc/TR/result.mat
graph.shadecolor = graph.colors.mvpalab{1};
graph.sigc = graph.colors.mvpalab{1};
graph.sigh = -.001;
mvpalab_plotcr(graph,cfg,result);
% load  D:\AttExpLoc_EEG\Results\EEG\Definitive\Voltage\RSA\Block\result.mat
% graph.shadecolor = graph.colors.venus{1};
% graph.sigc = graph.colors.venus{1};
% graph.sigh = -.003;
% mvpalab_plotcr(graph,cfg,result,stats);