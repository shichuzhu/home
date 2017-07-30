clear
clc
clf

[temp,long_string]=system('find ./ -name \*.fig');
fignames=regexp(long_string,'[\f\n\r]','split');

loops=size(fignames,2)-1;
for szi=1:loops
	filename=cell2mat(fignames(szi));
	[temp,file_r]=system(['set temp_file="',filename,'";echo $temp_file:r']);
	h=openfig(filename,'new','invisible');
	file_r=file_r(1:end-1);		% I HATE THE ENTER AS THE LAST CHARACTER

	set(h,'Units','inches');
	screenposition =[19.0525,0,18.3854,10.9672];
	set(h,...
    	'PaperPosition',[0 0 screenposition(3:4)],...
        'PaperSize',[screenposition(3:4)]);
%	szoutfile=['untitled.pdf'];
%	eval(['print -dpdf -painters ',szoutfile]);
	saveas(h,file_r,'pdf');
	close(h);
end
