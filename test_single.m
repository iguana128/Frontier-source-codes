function []=test_single(type_index)

%close all
%% data input
load data_collapsed_single
load drug_infor
%% barcode extraction
for i = 1:length(sampleNames_single)
    index = findstr(sampleNames_single{i},'_');
    barcode(i,1) = str2num(sampleNames_single{i}(index(end)+1:end-1));
end
%% 
for i = 1:length(barcode)
    list = find(bar_total==barcode(i));
    single_setting{i,1} = setting{list};
    dose_single(i,1) = dose(list);
    drugs_single{i,1} = drugs{list};
end
%% clear 
clear bar_total barcode dose drugs i index list setting sampleNames_single
%%
load drug_overlap
sel = [];
for i = 1:length(drugs_single)
    if isempty(find(strcmp(drugs_single{i},drug_overlap)==1))==1
       sel = [sel,i];
    end
end
data_single(sel,:)=[];
dose_single(sel)=[];
drugs_single(sel)=[];
single_setting(sel)=[];
%%
type = {};
for i = 1:length(single_setting)
    list = findstr(single_setting{i},'_');
    if isempty(findstr(single_setting{i},'Control'))==1;
        type = [type;single_setting{i}(list(end-1)+1:end)];
    end
end
type = unique(type);

%% mtach control
for i = 1:length(single_setting)
    if isempty(findstr(single_setting{i},'Control'))==1
       kl = findstr(single_setting{i},'_');
       tmp = [single_setting{i}(1:kl(end)),'Control'];
       lk = find(strcmp(tmp,single_setting)==1);
       data_single(i,:)=data_single(i,:)-data_single(lk,:);
    end
end
%% high dose and longest dusingleion
gg = type{type_index};
for i = 1:length(single_setting)
    if findstr(single_setting{i},gg)
       list(i)=1;
    else
       list(i)=0;
    end
end
%%
data_single = data_single(find(list==1),:);
dose_single = dose_single(find(list==1));
drugs_single = drugs_single(find(list==1),1);
single_setting = single_setting(find(list==1));
%% DEG genesingleion
ll = find(ini_single>0.5);
data_single(:,ll)=[];
geneNames_single_collapsed(ll)=[];
DEG = struct();
num = 200;
[pairs_single,tani_single]=similarity(data_single,drugs_single,num);
clear data_single DEG dose_single geneNames_single_collapsed i ini_single kl list lk ll num single_setting tmp sel
save(['single_',gg,'.mat'])