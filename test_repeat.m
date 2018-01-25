function []=test_repeat(type_index)

%close all
%% data input
load data_collapsed_repeat
load drug_infor
%% barcode extraction
for i = 1:length(sampleNames_repeat)
    index = findstr(sampleNames_repeat{i},'_');
    barcode(i,1) = str2num(sampleNames_repeat{i}(index(end)+1:end-1));
end
%% 
for i = 1:length(barcode)
    list = find(bar_total==barcode(i));
    repeat_setting{i,1} = setting{list};
    dose_repeat(i,1) = dose(list);
    drugs_repeat{i,1} = drugs{list};
end
%% clear 
clear bar_total barcode dose drugs i index list setting sampleNames_repeat
%%
load drug_overlap
sel = [];
for i = 1:length(drugs_repeat)
    if isempty(find(strcmp(drugs_repeat{i},drug_overlap)==1))==1
       sel = [sel,i];
    end
end
data_repeat(sel,:)=[];
dose_repeat(sel)=[];
drugs_repeat(sel)=[];
repeat_setting(sel)=[];
%%
type = {};
for i = 1:length(repeat_setting)
    list = findstr(repeat_setting{i},'_');
    if isempty(findstr(repeat_setting{i},'Control'))==1;
        type = [type;repeat_setting{i}(list(end-1)+1:end)];
    end
end
type = unique(type);

%% mtach control
for i = 1:length(repeat_setting)
    if isempty(findstr(repeat_setting{i},'Control'))==1
       kl = findstr(repeat_setting{i},'_');
       tmp = [repeat_setting{i}(1:kl(end)),'Control'];
       lk = find(strcmp(tmp,repeat_setting)==1);
       data_repeat(i,:)=data_repeat(i,:)-data_repeat(lk,:);
    end
end
%% high dose and longest durepeation
gg = type{type_index};
for i = 1:length(repeat_setting)
    if findstr(repeat_setting{i},gg)
       list(i)=1;
    else
       list(i)=0;
    end
end
%%
data_repeat = data_repeat(find(list==1),:);
dose_repeat = dose_repeat(find(list==1));
drugs_repeat = drugs_repeat(find(list==1),1);
repeat_setting = repeat_setting(find(list==1));
%% DEG generepeation
ll = find(ini_repeat>0.5);
data_repeat(:,ll)=[];
geneNames_repeat(ll)=[];
DEG = struct();
num = 200;
[pairs_repeat,tani_repeat]=similarity(data_repeat,drugs_repeat,num);
clear data_repeat DEG dose_repeat geneName_repeat i ini_repeat repeat_setting kl list lk ll num tmp sel
save(['repeat_',gg,'.mat'])

