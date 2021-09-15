
%% Basic configuration file for MVPA analysis - Folder and data files:
% %% IF MVPA
% cfg.analysis = 'MVPA';
% cfg.location = '/home/chema/Documents/Experiments/AttExpLoc_EEG/Results/MVPA/Target/Exp/Val/3T/';
% 
% condition_a = 'target_val_face_exp';
% condition_b = 'target_val_name_exp';
% 
% % Condition indentifiers:
% cfg.study.conditionIdentifier{1,1} = condition_a;
% cfg.study.conditionIdentifier{1,2} = condition_b;
% 
% % Data paths:
% cfg.study.dataPaths{1,1} = ['/home/chema/Desktop/data/chema/AttExpLoc/Data/EEG/conditions/mat/' condition_a '/'] ; %[ ]
% cfg.study.dataPaths{1,2} = ['/home/chema/Desktop/data/chema/AttExpLoc/Data/EEG/conditions/mat/' condition_b '/'];
% 
% % Data files:
% for d = 1: 48
%     datafiles{d} = [int2str(d) '.mat'];
% end
% 
% cfg.study.dataFiles{1,1} = datafiles;
% cfg.study.dataFiles{1,2} = datafiles;

%% IF Theoretical
% cfg.study = [];
% cfg.analysis = 'RSA';
% cfg.location = 'D:\AttExpLoc_EEG\Results\EEG\Definitive\Voltage\RSA\Complete\';
% 
% condition_a = 'cue_at_name_1';
% condition_b = 'cue_at_name_2';
% condition_c = 'cue_ex_name_1';
% condition_d = 'cue_ex_name_2';
% condition_e = 'cue_at_face_1';
% condition_f = 'cue_at_face_2';
% condition_g = 'cue_ex_face_1';
% condition_h = 'cue_ex_face_2';
% 
% % Condition indentifiers:
% cfg.study.conditionIdentifier{1} = condition_a;
% cfg.study.conditionIdentifier{2} = condition_b;
% cfg.study.conditionIdentifier{3} = condition_c;
% cfg.study.conditionIdentifier{4} = condition_d;
% cfg.study.conditionIdentifier{5} = condition_e;
% cfg.study.conditionIdentifier{6} = condition_f;
% cfg.study.conditionIdentifier{7} = condition_g;
% cfg.study.conditionIdentifier{8} = condition_h;
% 
% % Data paths:
% cfg.study.dataPaths{1} = ['D:\AttExpLoc_EEG\Data\EEG\conditions\mat\' condition_a '/'] ; %[ ]
% cfg.study.dataPaths{2} = ['D:\AttExpLoc_EEG\Data\EEG\conditions\mat\' condition_b '/'];
% cfg.study.dataPaths{3} = ['D:\AttExpLoc_EEG\Data\EEG\conditions\mat\' condition_c '/'] ; %[ ]
% cfg.study.dataPaths{4} = ['D:\AttExpLoc_EEG\Data\EEG\conditions\mat\' condition_d '/'];
% cfg.study.dataPaths{5} = ['D:\AttExpLoc_EEG\Data\EEG\conditions\mat\' condition_e '/'] ; %[ ]
% cfg.study.dataPaths{6} = ['D:\AttExpLoc_EEG\Data\EEG\conditions\mat\' condition_f '/'];
% cfg.study.dataPaths{7} = ['D:\AttExpLoc_EEG\Data\EEG\conditions\mat\' condition_g '/'] ; %[ ]
% cfg.study.dataPaths{8} = ['D:\AttExpLoc_EEG\Data\EEG\conditions\mat\' condition_h '/'];
% 
% % Data files:
% for d = 1:48
%     datafiles{d} = [int2str(d) '.mat'];
% end
% 
% cfg.study.dataFiles{1} = datafiles;
% cfg.study.dataFiles{2} = datafiles;
% cfg.study.dataFiles{3} = datafiles;
% cfg.study.dataFiles{4} = datafiles;
% cfg.study.dataFiles{5} = datafiles;
% cfg.study.dataFiles{6} = datafiles;
% cfg.study.dataFiles{7} = datafiles;
% cfg.study.dataFiles{8} = datafiles;

%% IF Empirical

cfg.study = [];
cfg.analysis = 'RSA_emp';

cfg.location = '/Users/chema/Documents/Doctorado/AttExpLoc_EEG/Results/EEG/RSA/Loc_Cue/Att_Loc/TR';

condition_a = 'cue_name_att';
condition_b = 'cue_face_att';
condition_c = 'loc_name';
condition_d = 'loc_face';


% Condition indentifiers:
cfg.study.conditionIdentifier{1,1} = condition_a;
cfg.study.conditionIdentifier{1,2} = condition_b;
cfg.study.conditionIdentifier{2,1} = condition_c;
cfg.study.conditionIdentifier{2,2} = condition_d;


% Data paths:
cfg.study.dataPaths{1,1} = ['/Users/chema/Documents/Doctorado/AttExpLoc_EEG/Data/EEG/conditions/mat/' condition_a '/'] ; %[ ]
cfg.study.dataPaths{1,2} = ['/Users/chema/Documents/Doctorado/AttExpLoc_EEG/Data/EEG/conditions/mat/' condition_b '/'];
cfg.study.dataPaths{2,1} = ['/Users/chema/Documents/Doctorado/AttExpLoc_EEG/Data/EEG/conditions/mat/' condition_c '/'] ; %[ ]
cfg.study.dataPaths{2,2} = ['/Users/chema/Documents/Doctorado/AttExpLoc_EEG/Data/EEG/conditions/mat/' condition_d '/'];


% Data files:
for d = 1:48
    datafiles{d} = [int2str(d) '.mat'];
end

cfg.study.dataFiles{1,1} = datafiles;
cfg.study.dataFiles{1,2} = datafiles;
cfg.study.dataFiles{2,1} = datafiles;
cfg.study.dataFiles{2,2} = datafiles;


%% FEATURE EXTRACTION:

cfg.feature = 'voltage';

% cfg.feature = 'voltage'  - Raw voltage as feature.
% cfg.feature = 'envelope' - Power evelope as feature.

cfg.powenv.method = 'analytic';
cfg.powenv.uplow  = 'upper';
cfg.powenv.length = 5;

% cfg.powenv.method = 'analytic' - Envelope using the analytic signal.
% cfg.powenv.method = 'peak'     - Peak envelopes.

% cfg.powenv.uplow = 'upper' - Select upper envelope.
% cfg.powenv.uplow = 'lower' - Select lower envelope.

%% TRIAL AVERAGE:

cfg.trialaver.flag     = false;
cfg.trialaver.ntrials  = 3;
cfg.trialaver.order    = 'rand';

% cfg.trialaver.order = 'rand' - Random order.
% cfg.trialaver.order = 'seq'  - Secuential order.

%% BALANCED DATASETS:

cfg.classsize.match = true;
cfg.classsize.matchkfold = false;

%% DIMENSION REDUCTION:

% cfg.dimred.method = 'none' - Diemnsion reduction disabled.
% cfg.dimred.method = 'pca'  - Principal Component Analysis.

cfg.dimred.method = 'none';
cfg.dimred.ncomp  = 0;

%% DATA NORMALIZATION:

% cfg.normdata = 0 - raw data
% cfg.normdata = 1 - z-score (across features)
% cfg.normdata = 2 - z-score (across time)
% cfg.normdata = 3 - z-score (across trials)
% cfg.normdata = 4 - std_nor (across trials)

cfg.normdata = 4; 

%% DATA SMOOTHING:

% cfg.smoothdata.method = 'none'   - Data smooth disabled.
% cfg.smoothdata.method = 'moving' - Moving average method.

cfg.smoothdata.method   = 'moving';
cfg.smoothdata.window   = 5;

%% ANALYSIS TIMING:

cfg.tm.tpstart   = -100;
cfg.tm.tpend     = 1550;
cfg.tm.tpsteps   = 3;

%% CLASSIFICATION ALGORITHM:

% cfg.classmodel.method = 'svm' - Support Vector Machine.
cfg.classmodel.method = 'da' % - Linear Discriminant Analysis.

% cfg.classmodel.kernel = 'linear'     - Support Vector Machine.
% cfg.classmodel.kernel = 'gaussian'   - Support Vector Machine.
% cfg.classmodel.kernel = 'rbf'        - Support Vector Machine.
% cfg.classmodel.kernel = 'polynomial' - Support Vector Machine.

% cfg.classmodel.kernel = 'linear' - Discriminant Analysis.
% cfg.classmodel.kernel = 'quadratic' - Discriminant Analysis.
% 
% cfg.classmodel.method = 'svm';
cfg.classmodel.kernel = 'linear';

%% HYPERPARAMETERS OPTIMIZATION:

cfg.classmodel.optimize.flag = false;
cfg.classmodel.optimize.params = {'BoxConstraint'};
cfg.classmodel.optimize.opt = struct('Optimizer','gridsearch',...
    'ShowPlots',false,'Verbose',0,'Kfold', 5);

%% PERFORMANCE METRICS:

cfg.classmodel.roc       = false;
cfg.classmodel.auc       = true;
cfg.classmodel.confmat   = false;
cfg.classmodel.precision = false;
cfg.classmodel.recall    = false;
cfg.classmodel.f1score   = false;
cfg.classmodel.wvector   = true;

%% RSA CONFIGURATION:
cfg.classmodel.rsatempgen = false;

%% EXTRA CONFIGURATION:

cfg.classmodel.tempgen = true;
cfg.classmodel.extdiag = true;
cfg.classmodel.parcomp = true;
cfg.classmodel.permlab = false;

%% CROSS-VALIDATIONN PROCEDURE:

% cfg.cv.method = 'kfold' - K-Fold cross-validation.
% cfg.cv.method = 'loo'   - Leave-one-out cross-validation.

cfg.cv.method  = 'kfold';
cfg.cv.nfolds  = 5;

%% PERMUTATION TEST

cfg.stats.flag   = 1;
cfg.stats.nper   = 10;
cfg.stats.nperg  = 1e5;
cfg.stats.pgroup = 95;
cfg.stats.pclust = 95;
cfg.stats.shownulldis = 1;
