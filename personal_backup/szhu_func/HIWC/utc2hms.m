function [hms]=utc2hms(utc)

hms=mod(utc,60)+mod(floor(utc/60),60)*100+floor(utc/3600)*10000;

end
