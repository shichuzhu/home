function [ ranking ] = sz_tiedrank( x )
%SZ_TIERANK Rank adjusted for ties
% Same effect as matlab function tiedrank
% http://www.mathworks.com/help/stats/tiedrank.html
% source website from stackflow
% https://stackoverflow.com/questions/18746759/assign-rank-to-numbers-in-a-vector/18747075#18747075?newreg=9796cdc472f241e994a3ea60cabddf89

[~, ~, idx_u] = unique(x);
[~, idx_s] = sort(x);
[~, idx_s_inv] = sort(idx_s);
mean_ranks = accumarray(idx_u(:), idx_s_inv, [], @mean);
ranking = mean_ranks(idx_u);
end

