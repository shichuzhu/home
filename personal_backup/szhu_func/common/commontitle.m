function [  ] = commontitle( string )
%COMMONTITLE Summary of this function goes here
%   Detailed explanation goes here

ax=axes('Units','Normal','Position',[.075 .075 .85 .85],'Visible','off');
set(get(ax,'Title'),'Visible','on');
title(string);
end

