clc
clear all

aT= [4594,  2633,  938];
bT=categorical({'a: 10 ng','b: 100 pg','c: 1 pg'});
bar (bT,  aT);
plot(bT, aT, 'o-');

% aC=[4100 3543 4092 5392 5516] ;
% bC=bT;
% R=[.527 .796 .776 .800 1.000];
% 
% plot (bC, aC, '*-');