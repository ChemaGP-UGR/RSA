function [X,Y,cfg] = mvpalab_datalabels(cfg,fv)
%MVPALAB_DATALABELS Summary of this function goes here
%   Detailed explanation goes here
    X.a = [];
    Y.a = [];
    X.b = [];
    Y.b = [];
    
    if strcmp(cfg.analysis, 'RSA_the')
        for i = 1:length(fv)
            X.a = [X.a;fv{i}];
            if mod (i,2)==1
                Y.a = [Y.a;logical(zeros(size(fv{i},1),1))];
            else
                Y.a = [Y.a;logical(ones(size(fv{i},1),1))];
            end
        end
    elseif strcmp(cfg.analysis, 'RSA_emp')
        for i = 1:length(fv)/2
            X.a = [X.a;fv{i}];
            X.b = [X.b;fv{i+length(fv)/2}];
            if mod(i,2)==1
                Y.a = [Y.a;logical(zeros(size(fv{i},1),1))];
                Y.b = [Y.b;logical(zeros(size(fv{i+length(fv)/2},1),1))];
            else
                Y.a = [Y.a;logical(ones(size(fv{i},1),1))];
                Y.b = [Y.b;logical(ones(size(fv{i+length(fv)/2},1),1))];
            end
        end
    end

%     if length(fv) > 2
%         X.b = [fv{3};fv{4}];
%         Y.b = logical([zeros(size(fv{3},1),1);ones(size(fv{4},1),1)]);
%     end
end