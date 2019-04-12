%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% example1.m :
%%%		Non-interactive script that shows:
%%%     - how to use an external function that retrieves financial data
%%%     - how to use different plotting methods
%%%     - how to export the plots in different graphic formats instead of 
%%%       displaying them
%%%
%%%		Valentin Plugaru <Valentin.Plugaru@gmail.com> 2014-03-18
%%%     - 2017-06-12: Use Google Finance in place of Yahoo, which dissapeared
%%%     - 2018-06-13: Mention use of an offline data source, in case Google
%%%                   Finance API is not available
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% run computations on only one core:
tic
a = nan(1, 1000);
for idx = 1:1000
    a(idx) = norm(eig(rand(100)));
end
exec_time_serial = toc;

%% start a parallel pool:
p = parpool(4);

%% run computations in parallel:
tic
b = nan(1, 1000);
parfor idx = 1:1000
    b(idx) = norm(eig(rand(100)));
end
exec_time_par = toc;

p.delete