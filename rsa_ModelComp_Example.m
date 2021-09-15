function [corr, cfg] = rsa_ModelComp_analysis( cfg, fv, permute, model)
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
    Y = fv{sub}.Y.a;
    %% Generate THEORETICAL RDM (OUR MODEL)
    %% very IMPORTANT: Here we will work with RDMs... D = dissimilarity values. 
    % If we correlate a theoretical SIMILARITY matrix with an empirical
    % DISSIMILARITY matrix, negative correlations will appear [tears]
    Y_matrix = NaN(size(Y,1),size(Y,1));
    
    if strcmp(model, 'content') 
        for i = 1:size(Y)
            for ii = 1:size(Y)
                if ii > size(Y,1)/2
                    if i > size(Y,1)/2
                        Y_matrix(i,ii) = 0;
                    else
                        Y_matrix(i,ii) = 1;
                    end   
                else
                    if i > size(Y,1)/2
                        Y_matrix(i,ii) = 1;
                    else
                        Y_matrix(i,ii) = 0;
                    end   
                end
            end
        end
    elseif strcmp(model,'block')
        for i = 1:size(Y)/2
            for ii = 1:size(Y)/2
                if ii > size(Y,1)/4
                    if i > size(Y,1)/4
                        Y_matrix(i,ii) = 0;
                    else
                        Y_matrix(i,ii) = 1;
                    end   
                else
                    if i > size(Y,1)/4
                        Y_matrix(i,ii) = 1;
                    else
                        Y_matrix(i,ii) = 0;
                    end   
                end
            end
        end
        for i = 1:size(Y,1)/2
            for ii = 1:size(Y,1)/2
                Y_matrix(i,ii+size(Y,1)/2) = Y_matrix (i,ii);
                Y_matrix(i+size(Y,1)/2,ii) = Y_matrix (i,ii);
                Y_matrix(i+size(Y,1)/2,ii+size(Y,1)/2) = Y_matrix (i,ii);
            end
        end
    elseif strcmp(model, 'complete')
        for i = 1:size(Y)/2
             for ii = 1:size(Y)/2
                if ii > size(Y,1)/4
                    if i > size(Y,1)/4
                        Y_matrix(i,ii+size(Y,1)/2) = 0;
                        Y_matrix(i+size(Y,1)/2,ii) = 0;
                    else
                        Y_matrix(i,ii+size(Y,1)/2) = 1;
                        Y_matrix(i+size(Y,1)/2,ii) = 1;
                    end   
                else
                    if i > size(Y,1)/4
                        Y_matrix(i,ii+size(Y,1)/2) = 1;
                        Y_matrix(i+size(Y,1)/2,ii) = 1;
                    else
                        Y_matrix(i,ii+size(Y,1)/2) = 0;
                        Y_matrix(i+size(Y,1)/2,ii) = 0;
                    end   
                end
                for ii = 1:size(Y)/2
                    Y_matrix(i,ii) = 0;
                    Y_matrix(i+size(Y,1)/2,ii+size(Y,1)/2) = 0;
                end
             end
        end      
    elseif strcmp(model, 'cues')
           for i = 1:size(Y,1)/2             
               for ii = 1:size(Y,1)/2
                Y_matrix(i,ii) = ~(Y(i) == Y(ii)); % ~ = dissimilarity
                Y_matrix(i+size(Y,1)/2,ii+size(Y,1)/2) = ~(Y(i) == Y(ii));
                Y_matrix(i,ii+size(Y,1)/2) = 1;
                Y_matrix(i+size(Y,1)/2,ii) = 1;             
               end
           end
    end
    

    % Remove diagonal and upper triangle, vectorize:
    Y_matrix(logical(eye(size(Y_matrix)))) = 0; 
    Y_matrix = squareform(Y_matrix);

    %% WHERE MAGIC HAPPENS: RSA function 
    c = cfg.tm;
    [corr_sbj] = rsa_Example(c,X,Y_matrix,permute); 
    
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
