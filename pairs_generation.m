clear 
close all
% This scipt is used to genrate pair-wise similarity between any two compounds in different 
% time/dose/testing system combination.
% There are 9 time/dose combinations (3 durantions*3 doses) for rat in
% vitro testing system and 12 time/dose combinations (4 durations*3 doses) for two in vivo testing systems
% the data will be automatically generated and save to your workspace
% the code was written by Zhichao Liu at NCTR/FDA

for i=1:9
    test_rat(i);
end
for i=1:12
    test_single(i);
    test_repeat(i);
end
clear i