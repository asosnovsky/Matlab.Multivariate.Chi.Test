%% Example of Use
clc;clear pd
% Define new distribution
pd = makedist('Normal');

%% Univariate Case
clc;clear X G Results Chi
% Create a dataset  
X = random(pd,1000,1);
F = @(x) cdf(pd,x);

% Chi Test
[Chi, pVal, nObs, nBin] = mcgoft(X,F,50);

% Print
TestInt = @(R) native2unicode(R*'Pass'+(1-R)*'Fail');
fprintf('----------------\nResults  : %s\nChi Score: %3.3f\n----------------\n',...
    TestInt(pVal<0.05) , Chi);

%% Bivariate Case
clear X G Results Chi
clc;clear X G Results Chi
% Create a dataset
X = random(pd,250,2);
F = @(x) prod(cdf(pd,x'),2);% Assuming independance of X's

tic
% Chi Test
[Chi, pVal, nObs, nBin] = mcgoft(X,F,20);
toc

% Print
TestInt = @(R) native2unicode(R*'Pass'+(1-R)*'Fail');
fprintf('----------------\nResults  : %s\nChi Score: %3.3f\n----------------\n',...
    TestInt(pVal<0.05) , Chi);

%% Trivariate Case
% May take a bit
clear X G Results Chi
clc;clear X G Results Chi
% Create a dataset
X = random(pd,500,3);
F = @(x) prod(cdf(pd,x'),2);

tic
% Chi Test
[Chi, pVal, nObs, nBin] = mcgoft(X,F,20);
toc

% Print
TestInt = @(R) native2unicode(R*'Pass'+(1-R)*'Fail');
fprintf('----------------\nResults  : %s\nChi Score: %3.3f\n----------------\n',...
    TestInt(pVal<0.05) , Chi);

%% Quadvariate Case
% [WARNING!]
% May take a bit and a lot of memory,
% Run this at your own discretion!
% [WARNING!]
clear X G Results Chi
clc;clear X G Results Chi
% Create a dataset
rng('default');  
X = random(pd,2000,4);
F = @(x) prod(cdf(pd,x'),2);

tic
% Chi Test
[Chi, pVal, nObs, nBin] = mcgoft(X,F,20);
toc

% Print
TestInt = @(R) native2unicode(R*'Pass'+(1-R)*'Fail');
fprintf('----------------\nResults  : %s\nChi Score: %3.3f\n----------------\n',...
    TestInt(pVal<0.05) , Chi);
%% Wrong Case Example
clear X G Results Chi
clc;clear X G Results Chi
% Create a dataset
pd = makedist('Gamma');
X = random(pd,500,2);
pd = makedist('Normal');
F = @(x) prod(cdf(pd,x'),2);% Assuming independance of X's

tic
% Chi Test
[Chi, pVal, nObs, nBin] = mcgoft(X,F,20);
toc

% Print
TestInt = @(R) native2unicode(R*'Pass'+(1-R)*'Fail');
fprintf('----------------\nResults  : %s\nChi Score: %3.3f\n----------------\n',...
    TestInt(pVal<0.05) , Chi);