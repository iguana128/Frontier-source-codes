clear
close all
% data generation
% generate the pairwise similarity between any two compounds in different 
% time/dose/testing system combination.
pairs_genration 
% PRank analysis in different time/dose combinations
%% high_dose-longest durations
load('rat_24 hr_High.mat')
load('single_24 hr_High.mat')
load('repeat_29 day_High.mat')
[AUC_hl_rat_single] = roc_make(tani_rat,tani_single);
[AUC_hl_rat_repeat] = roc_make(tani_rat,tani_repeat);
[AUC_hl_single_repeat] = roc_make(tani_single,tani_repeat);
clear drug_overlap drugs_rat drugs_repeat drugs_single geneNames_repeat gg pairs_rat pairs_single pairs_repeat tani_rat tani_single tani_repeat type type_index
%% hig_dose-middle durations1
load('rat_8 hr_High.mat')
load('single_6 hr_High.mat')
load('repeat_8 day_High.mat')
[AUC_hm1_rat_single] = roc_make(tani_rat,tani_single);
[AUC_hm1_rat_repeat] = roc_make(tani_rat,tani_repeat);
[AUC_hm1_single_repeat] = roc_make(tani_single,tani_repeat);
clear drug_overlap drugs_rat drugs_repeat drugs_single geneNames_repeat gg pairs_rat pairs_single pairs_repeat tani_rat tani_single tani_repeat type type_index
%% hig_dose-middle durations2
load('rat_8 hr_High.mat')
load('single_9 hr_High.mat')
load('repeat_15 day_High.mat')
[AUC_hm2_rat_single] = roc_make(tani_rat,tani_single);
[AUC_hm2_rat_repeat] = roc_make(tani_rat,tani_repeat);
[AUC_hm2_single_repeat] = roc_make(tani_single,tani_repeat);
clear drug_overlap drugs_rat drugs_repeat drugs_single geneNames_repeat gg pairs_rat pairs_single pairs_repeat tani_rat tani_single tani_repeat type type_index
%% hig_dose-short duration
load('rat_2 hr_High.mat')
load('single_3 hr_High.mat')
load('repeat_4 day_High.mat')
[AUC_hs_rat_single] = roc_make(tani_rat,tani_single);
[AUC_hs_rat_repeat] = roc_make(tani_rat,tani_repeat);
[AUC_hs_single_repeat] = roc_make(tani_single,tani_repeat);
clear drug_overlap drugs_rat drugs_repeat drugs_single geneNames_repeat gg pairs_rat pairs_single pairs_repeat tani_rat tani_single tani_repeat type type_index
%%
% Middle_dose-longest durations
load('rat_24 hr_Middle.mat')
load('single_24 hr_Middle.mat')
load('repeat_29 day_Middle.mat')
[AUC_ml_rat_single] = roc_make(tani_rat,tani_single);
[AUC_ml_rat_repeat] = roc_make(tani_rat,tani_repeat);
[AUC_ml_single_repeat] = roc_make(tani_single,tani_repeat);
clear drug_overlap drugs_rat drugs_repeat drugs_single geneNames_repeat gg pairs_rat pairs_single pairs_repeat tani_rat tani_single tani_repeat type type_index
% Middle_dose-middle durations1
load('rat_8 hr_Middle.mat')
load('single_6 hr_Middle.mat')
load('repeat_8 day_Middle.mat')
[AUC_mm1_rat_single] = roc_make(tani_rat,tani_single);
[AUC_mm1_rat_repeat] = roc_make(tani_rat,tani_repeat);
[AUC_mm1_single_repeat] = roc_make(tani_single,tani_repeat);
clear drug_overlap drugs_rat drugs_repeat drugs_single geneNames_repeat gg pairs_rat pairs_single pairs_repeat tani_rat tani_single tani_repeat type type_index
% Middle_dose-middle durations2
load('rat_8 hr_Middle.mat')
load('single_9 hr_Middle.mat')
load('repeat_15 day_Middle.mat')
[AUC_mm2_rat_single] = roc_make(tani_rat,tani_single);
[AUC_mm2_rat_repeat] = roc_make(tani_rat,tani_repeat);
[AUC_mm2_single_repeat] = roc_make(tani_single,tani_repeat);
clear drug_overlap drugs_rat drugs_repeat drugs_single geneNames_repeat gg pairs_rat pairs_single pairs_repeat tani_rat tani_single tani_repeat type type_index
% Middle_dose-short durations
load('rat_2 hr_Middle.mat')
load('single_3 hr_Middle.mat')
load('repeat_4 day_Middle.mat')
[AUC_ms_rat_single] = roc_make(tani_rat,tani_single);
[AUC_ms_rat_repeat] = roc_make(tani_rat,tani_repeat);
[AUC_ms_single_repeat] = roc_make(tani_single,tani_repeat);
clear drug_overlap drugs_rat drugs_repeat drugs_single geneNames_repeat gg pairs_rat pairs_single pairs_repeat tani_rat tani_single tani_repeat type type_index
%%
% low_dose-longest durations
load('rat_24 hr_Low.mat')
load('single_24 hr_Low.mat')
load('repeat_29 day_Low.mat')
[AUC_ll_rat_single] = roc_make(tani_rat,tani_single);
[AUC_ll_rat_repeat] = roc_make(tani_rat,tani_repeat);
[AUC_ll_single_repeat] = roc_make(tani_single,tani_repeat);
clear drug_overlap drugs_rat drugs_repeat drugs_single geneNames_repeat gg pairs_rat pairs_single pairs_repeat tani_rat tani_single tani_repeat type type_index
% low_dose-middle durations1
load('rat_8 hr_Low.mat')
load('single_6 hr_Low.mat')
load('repeat_8 day_Low.mat')
[AUC_lm1_rat_single] = roc_make(tani_rat,tani_single);
[AUC_lm1_rat_repeat] = roc_make(tani_rat,tani_repeat);
[AUC_lm1_single_repeat] = roc_make(tani_single,tani_repeat);
clear drug_overlap drugs_rat drugs_repeat drugs_single geneNames_repeat gg pairs_rat pairs_single pairs_repeat tani_rat tani_single tani_repeat type type_index
% low_dose-middle durations2
load('rat_8 hr_Low.mat')
load('single_9 hr_Low.mat')
load('repeat_15 day_Low.mat')
[AUC_lm2_rat_single] = roc_make(tani_rat,tani_single);
[AUC_lm2_rat_repeat] = roc_make(tani_rat,tani_repeat);
[AUC_lm2_single_repeat] = roc_make(tani_single,tani_repeat);
clear drug_overlap drugs_rat drugs_repeat drugs_single geneNames_repeat gg pairs_rat pairs_single pairs_repeat tani_rat tani_single tani_repeat type type_index
% low_dose-short durations
load('rat_2 hr_Low.mat')
load('single_3 hr_Low.mat')
load('repeat_4 day_Low.mat')
[AUC_ls_rat_single] = roc_make(tani_rat,tani_single);
[AUC_ls_rat_repeat] = roc_make(tani_rat,tani_repeat);
[AUC_ls_single_repeat] = roc_make(tani_single,tani_repeat);
clear drug_overlap drugs_rat drugs_repeat drugs_single geneNames_repeat gg pairs_rat pairs_single pairs_repeat tani_rat tani_single tani_repeat type type_index
total = [AUC_hl_single_repeat;AUC_hl_rat_repeat;AUC_hl_rat_single;AUC_hm1_single_repeat;AUC_hm1_rat_repeat;AUC_hm1_rat_single;...
    AUC_hm2_single_repeat;AUC_hm2_rat_repeat;AUC_hm2_rat_single;AUC_hs_single_repeat;AUC_hs_rat_repeat;AUC_hs_rat_single;...
    AUC_ml_single_repeat;AUC_ml_rat_repeat;AUC_ml_rat_single;AUC_mm1_single_repeat;AUC_mm1_rat_repeat;AUC_mm1_rat_single;...
    AUC_mm2_single_repeat;AUC_mm2_rat_repeat;AUC_mm2_rat_single;AUC_ms_single_repeat;AUC_ms_rat_repeat;AUC_ms_rat_single;...
    AUC_ll_single_repeat;AUC_ll_rat_repeat;AUC_ll_rat_single;AUC_lm1_single_repeat;AUC_lm1_rat_repeat;AUC_lm1_rat_single;...
    AUC_lm2_single_repeat;AUC_lm2_rat_repeat;AUC_lm2_rat_single;AUC_ls_single_repeat;AUC_ls_rat_repeat;AUC_ls_rat_single];
%% ANNOVA ANALYSIS 
dose=[repmat({'h'},1,12),repmat({'m'},1,12),repmat({'l'},1,12)];
duration=[repmat({'L'},1,3),repmat({'M'},1,6),repmat({'S'},1,3),repmat({'L'},1,3),repmat({'M'},1,6),repmat({'S'},1,3),repmat({'L'},1,3),repmat({'M'},1,6),repmat({'S'},1,3)];
[P,T,STATS,TERMS]=anovan(total,{dose duration},'model','interaction','varnames',{'dose','duration'});