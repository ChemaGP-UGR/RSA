%% MVPA TOOLBOX - (cr_analysis.m)
% -------------------------------------------------------------------------
% Brain, Mind and Behavioral Research Center - University of Granada.
% Contact: % dlopez@ugr.es (David Lopez-García)
% -------------------------------------------------------------------------
clear
%% Initialize project and configure analysis:
cfg = mvpalab_init();
run cfg_rsa.m;

%% Load data, generate conditions and feature extraction:
[cfg,data,fv] = mvpalab_import_rsa(cfg);

%% Compute correct rate and permuted maps:
if strcmp (cfg.analysis, 'RSA_the')
    [corr, cfg] = rsa_ModelComp_Example(cfg,fv,0,'complete');

    [permuted_maps,cfg] = rsa_permutation_maps(cfg,fv,'complete');
    save([cfg.location],'corr','cfg','permuted_maps');
elseif strcmp(cfg.analysis, 'RSA_emp')
    [corr, cfg] = rsa_ModelComp_Empirical(cfg,fv,0);

    %[permuted_maps,cfg] = rsa_permutation_maps_emp(cfg,fv,'complete');
    %save([cfg.location],'corr','cfg','permuted_maps');
end



%% Run statiscctical analysis:
if strcmp(cfg.analysis, 'MVPA')
    realdata = acc; 
elseif strcmp(cfg.analysis, 'RSA')
    result = corr; 
end
%stats = permtest_rsa(cfg,result,permuted_maps);

%% Save results:
if strcmp(cfg.analysis, 'MVPA')
    save([cfg.savedir '\mvpa_results_stats'],'acc','permuted_maps','stats','cfg');
elseif strcmp(cfg.analysis, 'RSA')
    save([cfg.location 'result'],'result','cfg');
end
