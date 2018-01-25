function [j,kk] = over_fetch(a,b)
j=0;
kk = [];
for i = 1:length(a)
    if isempty(find(b==a(i)))==0 & a(i)~=0
        j=j+1;
        kk = [kk;a(i)];
    end
end
%%
if size(a,1)<size(a,2)
    a = a';
    b=b';
end
% if isempty(a)==1|isempty(b)==1
%     tani =0;
% else
%     tani = j/length(unique([a;b]));
% end