function [utc]=hms2utc(hms)

utc=mod(hms,100)+mod(floor(hms/100),100)*60+floor(hms/10000)*3600;

end
