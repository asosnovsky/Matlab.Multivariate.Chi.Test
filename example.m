%% Example of Use
clc;clear pd
% Define new distribution
pd = makedist('Normal');

%% Univariate Case
clc;clear X G Results Chi
% Create a dataset
rng('default');  
X = random(pd,1000,1);
F = @(x) cdf(pd,x);

% Chi Test
[Results, Chi] = mcgoft(X,F);

% Print
TestInt = @(R) native2unicode(R*'Pass'+(1-R)*'Fail');
fprintf('----------------\nResults  : %s\nChi Score: %3.3f\n----------------\n',...
    TestInt(Results) , Chi);

%% Bivariate Case
clear X G Results Chi
clc;clear X G Results Chi
% Create a dataset
rng('default');  
X = random(pd,1000,2);
F = @(x) prod(cdf(pd,x),2);% Assuming independance of X's

% Chi Test
Results = mcgoft(X,F);
% Print
TestInt = @(R) native2unicode(R*'Pass'+(1-R)*'Fail');
fprintf('-> Results  : %s\n',...
    TestInt(Results));

%% Trivariate Case
clear X G Results Chi
clc;clear X G Results Chi
% Create a dataset
rng('default');  
X = random(pd,1000,3);
F = @(x) prod(cdf(pd,x),2);

% Chi Test
Results = mcgoft(X,F);
% Print
TestInt = @(R) native2unicode(R*'Pass'+(1-R)*'Fail');
fprintf('-> Results  : %s\n',...
    TestInt(Results));

%% Quadvariate Case
% May take a bit
clear X G Results Chi
clc;clear X G Results Chi
% Create a dataset
rng('default');  
X = random(pd,1000,4);
F = @(x) prod(cdf(pd,x),2);

% Chi Test
Results = mcgoft(X,F);
% Print
TestInt = @(R) native2unicode(R*'Pass'+(1-R)*'Fail');
fprintf('-> Results  : %s\n',...
    TestInt(Results));
