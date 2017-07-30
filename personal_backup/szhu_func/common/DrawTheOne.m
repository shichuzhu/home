function []=DrawTheOne(filename,format,handle)

if nargin<1
    filename='sz_Untitled';
end
if nargin<2
    format='jpg';
end
if nargin<3
    handle=gcf;
end
set(handle,'Units','inches');
sztemp_length=23.191;
sztemp_width=13.045;
sztemp_myfiguresizes=[0,0,sztemp_length,sztemp_width];
set(handle,'PaperPosition',sztemp_myfiguresizes,'PaperSize',sztemp_myfiguresizes(3:4));
saveas(handle,filename,format);
end