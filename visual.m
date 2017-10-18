clc
rawdata=importdata(['data' filesep 'solution_201710172025.LLH'],' ',0);
r1=rawdata.textdata;
rawdata=rawdata.data;
date=[];
time=[];
t=[];

x = data(:,1);
y = data(:,2);
z = data(:,3);
z = z-min(z);
z=z/max(z);

figure(1);
plot(y,x);

title('Route')
hold on
for i=1:length(x)
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
    plot(y(i),x(i),'-mo',...
        'LineWidth',1,...
        'MarkerEdgeColor',depth,...
        'MarkerFaceColor',[1 1 1],...
        'MarkerSize',2);
    hold on
end
hold off;

figure(2);
plot(t,z);
title('Height (z) over time')
   
