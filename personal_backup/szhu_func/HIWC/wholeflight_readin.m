function [  ] = wholeflight_readin( server, sep, reso)
%wholeflight_readin Read in the HIWC whole flight data
% [ PSD, COUNTS, bin_mid, bin_diff ] = HIWC_readin( server, sep, reso)

% server 1 PC, 2 Keeling
% sep default 55
% reso default 5

%221300, 223130
if server==1
    prefix='C:\zsz_data\HIWC\';
elseif server==2
    prefix='/data/mcfarq/a/szhu28/research/HIWC/08_150608copyfrompc/';
else
    error('Where are you running?');
end
division=prefix(end);

if time==0
    filename=[prefix,'HAIC-HIWC_comparisons',division,'f20-2014-02-18-205028-IKPV4.csv'];
    [timehmstwc,twc]=importTWC(filename);
    timehms=timehmstwc(2:end);
    twc=twc(2:end);
    twc(twc<=0)=NaN; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Missing value
    datapath=[prefix,'HAIC-HIWC_comparisons',division];
    probe2ds=ncread([datapath,'sizedist.UI.Will.2DS.cdf'],'conc_all_correct')'/10; % originally cm^-4
    count2ds=ncread([datapath,'sizedist.UI.Will.2DS.cdf'],'count_all_correct')';
    probepip=ncread([datapath,'sizedist.UI.Will.PIP.cdf'],'conc_all_correct')'/10; % originally cm^-4
    countpip=ncread([datapath,'sizedist.UI.Will.PIP.cdf'],'count_all_correct')';
else
    % probe 1 2ds, 2 pip
    %institutes={'Univ_of_Illinois';'UnivBlaisePascal';'EnvirCanada'};
    %institutes_abbr={'UI';'UBP';'EC'};
    [probe2ds, count2ds, ~,~,~]=readin_comparedata(prefix, institute, 1, time);
    %[probepip, countpip, commontimehms, commontime, data]=readin_comparedata(prefix,institute,2,time);
    [probepip, countpip, ~, ~, ~]=readin_comparedata(prefix, institute, 2, time);
end

if ~exist('sep','var')
    sep=55;
end

l1=sep;l2=size(probepip,2)-floor(sep/10);

bin_diff=[ones(1,l1-1)*10, 5 , ones(1,l2)*100];   % um
temp1=1:l1;
temp2=1:l2;temp2=temp2+floor(sep/10);

psd=[probe2ds(:,temp1),probepip(:,temp2)];   % 1/L/um
psd(:,l1)=(psd(:,(l1-1))+3*psd(:,l1))/4;
counts=[count2ds(:,temp1),countpip(:,temp2)];

temp1=temp1*10;
temp1(end)=temp1(end)-2.5;
temp2=temp2*100;
bin_mid=[temp1,temp2];

if ~exist('reso','var')
    reso=5;
end

%%% Working as the running average
% http://www.mathworks.com/help/matlab/ref/filter.html
PSD=filter(ones(1,reso)/reso,1,psd);
COUNTS=filter(ones(1,reso)/reso,1,counts);

indx=reso:reso:size(PSD,1);
if time==0
    twc=filter(ones(1,reso)/reso,1,twc);
    twc=twc(indx,:);
    timehms=timehms(indx-floor(reso/2));
else
    timehms=NaN;
    twc=NaN;
end

PSD=PSD(indx,:);
COUNTS=COUNTS(indx,:);

end

