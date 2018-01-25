function [pairs,tani_total]=similarity(data_rat,drugs_rat,num)
for i = 1:size(data_rat,1)
    DEG.(['drugs',num2str(i)]) = [];
    [m,n]=sort(data_rat(i,:),'descend');
    DEG.(['drugs',num2str(i)]) = [n(1:num),n(end:-1:end-num+1)];
end
%%
%% similarity
names = fieldnames(DEG);
fid = fopen('pairs_rat.txt','w'); 
tani_total = []; pairs ={};mm=0;
for i = 1:length(names)-1
    for j = i+1:length(names)
        mm=mm+1;
        [o1,kk_up] = over_fetch(DEG.(names{i})(1:num),DEG.(names{j})(1:num));
        [o2,kk_down] = over_fetch(DEG.(names{i})(end:-1:end-num+1),DEG.(names{j})(end:-1:end-num+1));
        %tani = (o1+o2)/length(unique([DEG.(names{i}),DEG.(names{j})]));
        tani = (o1+o2)/(2*num);
        tani_total = [tani_total;tani]; pairs =[pairs;[drugs_rat{i},'%',drugs_rat{j}]];
    end
end
%[m,n]=sort(tani_total,'descend');
%pairs = pairs(n);
%tani_total = tani_total(n);
