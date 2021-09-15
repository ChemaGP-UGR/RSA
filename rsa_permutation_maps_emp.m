function [ permuted_maps , cfg ] = rsa_rewardInteraction_permutation_maps( cfg, fv, model )
%PERMUTATION_MAPS This function generates permutation maps at a subject
%level for future statistical analyses.
fprintf('<strong> > Computing permutated maps: </strong>\n');

%% Subjects loop:
nsub = length(cfg.study.dataFiles{1});
for sub = 1 : nsub
    fprintf(['   - Subject: ' int2str(sub) '/' int2str(nsub) '\n']);
    clear Y_matrix
    %% Data and true labels:
    X = fv{sub}.X.a;
    Y = fv{sub}.X.b;
    % X: (concatenated data for cond A and B, channels, timepoints)
    % Y: conditions label
    
    %% Generate MODEL RDM : diiiiiissimilarity


    %% Generate permuted labels
    for p = 1 : cfg.stats.nper
        %% WHERE MAGIC HAPPENS: RSA function
        c = cfg.tm;
        corr_sbj = rsa_empirical(c,X,Y,1,cfg);
        fprintf(['     - Permutation: ' int2str(p) ' > ']);
        %     end
        
        if isrow(corr_sbj)
            permuted_maps(:,:,p,sub) = corr_sbj;
        else
            permuted_maps(:,:,p,sub) = corr_sbj';
        end
    end
end

