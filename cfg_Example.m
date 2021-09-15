%% Define subjects to analyze:
%  Define the subjects that should be analysed in a cell array inside the 
%  cfg data structure:
cfg.study.analysis = 'RSA'; 
cfg.study.studyLocation = 'D:\AttExp_Loc\Results\EEG\PILOTS\Voltage\RSA\Cue_Check'

condition_a = 'cue_at_name_1';
condition_b = 'cue_at_name_2';
condition_c = 'cue_at_face_1';
condition_d = 'cue_at_face_2';

% Condition indentifiers:
cfg.study.conditionIdentifier{1} = condition_a;
cfg.study.conditionIdentifier{2} = condition_b;
cfg.study.conditionIdentifier{3} = condition_c;
cfg.study.conditionIdentifier{4} = condition_d;

% Data paths:
cfg.study.dataPaths{1} = ['D:\AttExpLoc_EEG\Data\EEG\conditions\mat\' condition_a '/'] ; %[ ]
cfg.study.dataPaths{2} = ['D:\AttExpLoc_EEG\Data\EEG\conditions\mat\' condition_b '/'];
cfg.study.dataPaths{3} = ['D:\AttExpLoc_EEG\Data\EEG\conditions\mat\' condition_c '/'] ; %[ ]
cfg.study.dataPaths{4} = ['D:\AttExpLoc_EEG\Data\EEG\conditions\mat\' condition_d '/'];

% Data files:
for d = 1
    datafiles{d} = [int2str(d) '.mat'];
end

cfg.study.dataFiles{1,1} = datafiles;
cfg.study.dataFiles{1,2} = datafiles;
cfg.study.dataFiles{1,3} = datafiles;
cfg.study.dataFiles{1,4} = datafiles;


%% Configuration - Feature extraction:
%  Configuration of the feature extraction procedure:
        % AP stuff: Yo use single trial estimation (siguiendo mi expe de
        % reso [spam]. Al tener muchas condiciones [2*2*2 = 8 cond] y muy
        % pocos triasl [192/8 = 24 triasl/cond y muchos errores eliminados]
        % decidí pasar de los supertrials. Si tienes más observaciones,
        % sigue las directrices de tus MVPAs
%% Configuration - Feature extraction:

% Supertrial generation:
cfg.fext.strial.flag     = 0; %Super trials, yes/no
cfg.fext.strial.ntrials  = 5; %Super trials, size to average
cfg.fext.strial.rand = true; %Random selection vs Sequential selection

% Match data size to nfold:
cfg.fext.matchcsize = 1; %Match classes size
cfg.fext.matchkfold = 1; %Adapt size to k-fold

%% Configuration - Feature selection:

cfg.fsel.flag   = 0;
cfg.fsel.method = 'pca';
cfg.fsel.ncomp  = 1;

%% Configuration - classification analysis:

% Data smoothing:
cfg.smoothdata.flag = true; %Smoothing with sliding window
cfg.smoothdata.method = 'movmean'; % Smoothing method
cfg.smoothdata.window = 5; %Time points to average

% Notmalization methods:
% 0 - raw data
% 1 - z-score (across features)
% 2 - z-score (across time)
% 3 - z-score (across trials)
% 4 - std_nor (across trials)
cfg.normdata  = 4;

% Timming:
cfg.tm.tpstart  = -500; %Origin
cfg.tm.tpend    = 1000; %End
cfg.tm.tpsteps  = 3; %Take time points every n stemps.

% Cros-validation procedure:
cfg.cv.method  = 'kfold';
cfg.cv.nfolds  = 5;

% Classification model:
cfg.classmodel.parcomp  = true; %paralel computation to save time
cfg.classmodel.method = 'lda'; %classification method: lda, svm
cfg.classmodel.kernel = 'linear'; %kernel: linear, cuadratic, polynomic

% Temporal generalization:
cfg.classmodel.tempgen  = true;

% Additional performance metrics:
cfg.classmodel.confmat  = true;
cfg.classmodel.roc      = true;

% Configuration - Statistic for permutation method:
cfg.stats.nper   = 100;
cfg.stats.nperg  = 1e4;
cfg.stats.pgroup = 99.9;
cfg.stats.pclust = 99.9;
