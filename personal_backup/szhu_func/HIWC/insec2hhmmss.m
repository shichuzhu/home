function hhmmss=insec2hhmmss(insec)

hhmmss=mod(floor(insec/3600),24)*10000+floor(mod(insec,3600)/60)*100+mod(insec,60);

end
