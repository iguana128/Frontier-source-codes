function [AUC,X,Y] = roc_make(a,b)
X = []; Y=[]; AUC = 0;
for i = 0.4%[0.1 0.2 0.3 0.4 0.5 0.6]
    labels = zeros(length(b),1);
    labels(find(b>=i))=1;
    %[X(:,i*10),Y(:,i*10),T,AUC(i*10)] = perfcurve(labels,a,1);
    if isempty(find(b>=i))==0
       [X(:,1),Y(:,1),T,AUC(1)] = perfcurve(labels,a,1);
    end
end