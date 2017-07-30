function hhmmss=insec2abshhmmss(insec)

hhmmss=floor(insec/3600)*10000+floor(mod(insec,3600)/60)*100+mod(insec,60);

end
