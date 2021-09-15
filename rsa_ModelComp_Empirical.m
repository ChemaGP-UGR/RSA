function [corr, cfg] = rsa_ModelComp_analysis( cfg, fv, permute)
% Model-based RSA: 
%  (1) Make individual theoretical RDM 
%  (2) Compute time-resolved empirical RDM 
%  (3) Correlate theoretical and empirical RDM in each timepoint
fprintf('<strong> > Analyzing data: </strong>\n');
%% Subjects loop:
nsub = length(cfg.study.dataFiles{1});
for sub = 1 : nsub
    fprintf(['   - Subject: ' int2str(sub) '/' int2str(nsub) ' >> ']);
    
    %% Data and true labels:
    % X: (concatenated data for cond A and B, channels, timepoints)
    % Y: conditions label
    X = fv{sub}.X.a;
    Y = fv{sub}.X.b;
    %% Generate THEORETICAL RDM (OUR MODEL)
    %% very IMPORTANT: Here we will work with RDMs... D = dissimilarity values. 
    % If we correlate a theoretical SIMILARITY matrix with an empirical
    % DISSIMILARITY matrix, negative correlations will appear [tears]
    % Remove diagonal and upper triangle, vectorize:
    %% WHERE MAGIC HAPPENS: RSA function 
    c = cfg.tm;
    [corr_sbj] = rsa_empirical(c,X,Y,permute,cfg); 
    
    %% Store everything   
    if isrow(corr_sbj)
        corr(:,:,sub) = corr_sbj;
%         beta(:,:,sub) = regr_sbj;
    else
        corr(:,:,sub) = corr_sbj';  
%         beta(:,:,sub) = regr_sbj;
    end
end
fprintf(' - Done!\n');
