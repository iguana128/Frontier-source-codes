function []=test_rat(type_index)
%close all
%% data input
load data_collapsed_rat
load drug_infor
%% barcode extraction
for i = 1:length(sampleNames_rat)
    index = findstr(sampleNames_rat{i},'_');
    barcode(i,1) = str2num(sampleNames_rat{i}(index+1:end-1));
end
%% setting extraction
for i = 1:length(barcode)
    list = find(bar_total==barcode(i));
    rat_setting{i,1} = setting{list};
    dose_rat(i,1) = dose(list);
    drugs_rat{i,1} = drugs{list};
end
%% clear 
clear bar_total barcode dose drugs i index list setting sampleNames_rat
%% 
load drug_overlap
sel = [];
for i = 1:length(drugs_rat)
    if isempty(find(strcmp(drugs_rat{i},drug_overlap)==1))==1
       sel = [sel,i];
    end
end
data_rat(sel,:)=[];
dose_rat(sel)=[];
drugs_rat(sel)=[];
rat_setting(sel)=[];
%%
type = {};
for i = 1:length(rat_setting)
    list = findstr(rat_setting{i},'_');
    if isempty(findstr(rat_setting{i},'Control'))==1;
        type = [type;rat_setting{i}(list(end-1)+1:end)];
    end
end
type = unique(type);

%% mtach control
for i = 1:length(rat_setting)
    if isempty(findstr(rat_setting{i},'Control'))==1
       kl = findstr(rat_setting{i},'_');
       tmp = [rat_setting{i}(1:kl(end)),'Control'];
       lk = find(strcmp(tmp,rat_setting)==1);
       data_rat(i,:)=data_rat(i,:)-data_rat(lk,:);
    end
end
%% high dose and longest duration
gg = type{type_index};
for i = 1:length(rat_setting)
    if findstr(rat_setting{i},gg)
       list(i)=1;
    else
       list(i)=0;
    end
end
%%
data_rat = data_rat(find(list==1),:);
dose_rat = dose_rat(find(list==1));
drugs_rat = drugs_rat(find(list==1),1);
rat_setting = rat_setting(find(list==1));
%% DEG generation
ll = find(ini_rat>0.5);
data_rat(:,ll)=[];
geneNames_rat(ll)=[];
DEG = struct();
num = 200;
[pairs_rat,tani_rat]=similarity(data_rat,drugs_rat,num);
clear data_rat num DEG dose_rat geneNames_rat i ini_rat kl list lk ll rat_setting tmp sel
save(['rat_',gg,'.mat'])