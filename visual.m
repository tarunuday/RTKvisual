clc;
clear;
rawdata=importdata(['solution_201710272038.LLH'],' ',0);

r1=rawdata.textdata;
rawdata=rawdata.data;
date=[];
time=[];
t=[];

lat = rawdata(:,1);
lon = rawdata(:,2);
z = rawdata(:,3);
for i=1:length(lat)
    daterow=char(r1(i,1));
    daterow=strsplit(daterow,'/');
    daterow=char(daterow);
    daterow=str2num(daterow);
    daterow=daterow';
    date=[date;daterow];
    
    timerow=char(r1(i,2));
    timerow=strsplit(timerow,':');
    timerow=char(timerow);
    timerow=str2num(timerow);
    timerow=timerow';
    time=[time;timerow];
    t0=(time(1,1)*3600+time(1,2)*60+time(1,3));
    t=[t;(timerow(1)*3600+timerow(2)*60+timerow(3))-t0];
    
    depth=[z(i) 1-z(i) 0];
end
[x,y,zone] = ll2utm(lat,lon); %lat and lon arrays passed as arguments - returns x (array), y (array), zone
x_rel = x - x(1); % gets x_rel values by subtracting first value of x from all x values
y_rel = y - y(1); %gets y_rel values by subtracting first value of y from all y values
figure(1);
% plot(x,y, '-mo',...
%         'LineWidth',1,...
%         'MarkerEdgeColor',[0 0 0],...
%         'MarkerFaceColor',[1 1 1],...
%         'MarkerSize',2);
% title('Route(m)');
% xlabel('UTM X(m)');
% ylabel('UTM Y(m)');
% 
%figure (2);
plot(x_rel,y_rel, '-mo',... 
        'LineWidth',1,...
        'MarkerEdgeColor',[0 0 0],...
        'MarkerFaceColor',[1 1 1],...
        'MarkerSize',2);

grid on;
title('Route(m)-Difference in meters between data points');
xlabel('Difference between UTM X(m)');
ylabel('Difference between UTM Y(m)');