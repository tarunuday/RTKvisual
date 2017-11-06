clc;
clear;
rawdata=importdata(['solution_201710271947.LLH'],' ',0);
removePts=2000;
rawdata=rawdata.data;
rawdata(1:removePts,:)=[];

lat = rawdata(:,1);
lon = rawdata(:,2);
z = rawdata(:,3);
for i=1:length(lat)
    dist(i)=llh2m(lat(1),lon(1),lat(i),lon(i));
end
mu=mean(dist);
sig=std(dist);
figure(1)
plot(dist)

[x,y,zone] = ll2utm(lat,lon); %lat and lon arrays passed as arguments - returns x (array), y (array), zone
x_rel = x - x(1); % gets x_rel values by subtracting first value of x from all x values
y_rel = y - y(1); %gets y_rel values by subtracting first value of y from all y values
figure(2);

plot(x_rel,y_rel, '-mo',... 
        'LineWidth',1,...
        'MarkerEdgeColor',[0 0 1],...
        'MarkerFaceColor',[1 1 1],...
        'MarkerSize',1);
grid on;

title('Route(m)-Difference in meters between data points');
xlabel('Difference between UTM X(m)');
ylabel('Difference between UTM Y(m)');