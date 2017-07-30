function [ time, psd, count, bin_mid, bin_diff ] = singleprobe( filepath )
%wholeflight_readin Read in the HIWC whole flight data
% [ PSD, COUNTS, bin_mid, bin_diff ] = HIWC_readin( server, sep, reso)

psd=ncread(filepath,'conc_all_correct')'/10; % cm-4 to L-1um-1
count=ncread(filepath,'count_all_correct')';
time=ncread(filepath,'time');
bin_mid=ncread(filepath,'bin_mid')*1e3;
bin_diff=ncread(filepath,'bin_dD')*1e3;

end

