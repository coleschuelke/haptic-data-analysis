clc; clear all;close all;
load('good_xy_squares_3_subs.mat')

%% read arduino commands
sheelaArduinoCMD = readtable('G:\My Drive\NRI_data\CSV\Sheela_006\Sheila_006-arduino-cmdNormalized.csv');
sheelaArduinoCMD.dateTime = datetime(sheelaArduinoCMD.time(:), 'InputFormat', 'yyyy/MM/dd/HH:mm:ss.SSSSSS');
sheelaArduinoCMD = removevars(sheelaArduinoCMD, "time");
sheelaArduinoCMD = renamevars(sheelaArduinoCMD, "dateTime","time");
sheelaArduinoCMD = table2timetable(sheelaArduinoCMD);

andyArduinoCMD = readtable('G:\My Drive\NRI_data\CSV\Andy_001\Andy_001-arduino-cmdNormalized.csv');
andyArduinoCMD.dateTime = datetime(andyArduinoCMD.time(:), 'InputFormat', 'yyyy/MM/dd/HH:mm:ss.SSSSSS');
andyArduinoCMD = removevars(andyArduinoCMD, "time");
andyArduinoCMD = renamevars(andyArduinoCMD, "dateTime","time");
andyArduinoCMD = table2timetable(andyArduinoCMD);

tristanArduinoCMD = readtable('G:\My Drive\NRI_data\CSV\Tristan_007\Tristan_007-arduino-cmdNormalized.csv');
tristanArduinoCMD.dateTime = datetime(tristanArduinoCMD.time(:), 'InputFormat', 'yyyy/MM/dd/HH:mm:ss.SSSSSS');
tristanArduinoCMD = removevars(tristanArduinoCMD, "time");
tristanArduinoCMD = renamevars(tristanArduinoCMD, "dateTime","time");
tristanArduinoCMD = table2timetable(tristanArduinoCMD);
%% convert to datetime
andyxysquare.dateTime(:) = datetime(andyxysquare.time(:), 'InputFormat', 'yyyy/MM/dd/HH:mm:ss.SSSSSS');
andyxysquare = removevars(andyxysquare, "time");
andyxysquare = renamevars(andyxysquare, "dateTime","time");
andyxysquare = table2timetable(andyxysquare);

sheelaxysquare.dateTime(:) = datetime(sheelaxysquare.time(:), 'InputFormat', 'yyyy/MM/dd/HH:mm:ss.SSSSSS');
sheelaxysquare = removevars(sheelaxysquare, "time");
sheelaxysquare = renamevars(sheelaxysquare, "dateTime","time");
sheelaxysquare = table2timetable(sheelaxysquare);

tristanxysquare.dateTime(:) = datetime(tristanxysquare.time(:), 'InputFormat', 'yyyy/MM/dd/HH:mm:ss.SSSSSS');
tristanxysquare = removevars(tristanxysquare, "time");
tristanxysquare = renamevars(tristanxysquare, "dateTime","time");
tristanxysquare = table2timetable(tristanxysquare);

%% synchronize task data with command data

sheelaArduinoCMD = sheelaArduinoCMD(timerange(sheelaxysquare.time(1),sheelaxysquare.time(height(sheelaxysquare))), :);
andyArduinoCMD = andyArduinoCMD(timerange(andyxysquare.time(1),andyxysquare.time(height(andyxysquare))), :);
tristanArduinoCMD = tristanArduinoCMD(timerange(tristanxysquare.time(1),tristanxysquare.time(height(tristanxysquare))), :);

sheelaxysquare = synchronize(sheelaxysquare, sheelaArduinoCMD,'regular','nearest', 'SampleRate',5);

andyxysquare = synchronize(andyxysquare, andyArduinoCMD,'regular','nearest', 'SampleRate',5);

tristanxysquare = synchronize(tristanxysquare, tristanArduinoCMD,'regular','nearest', 'SampleRate',5);

%% convert datetimes to duration

andyxysquare.time.Format = "dd-MMM-uuuu HH:mm:ss.SSSSSS";
sheelaxysquare.time.Format = "dd-MMM-uuuu HH:mm:ss.SSSSSS";
tristanxysquare.time.Format = "dd-MMM-uuuu HH:mm:ss.SSSSSS";


andyxysquare.elapsedTime(:) = andyxysquare.time(:) - andyxysquare.time(1);
sheelaxysquare.elapsedTime(:) = sheelaxysquare.time(:) - sheelaxysquare.time(1);
tristanxysquare.elapsedTime(:) = tristanxysquare.time(:) - tristanxysquare.time(1);

%% Filter and clean data


%% plot all squares
fig=figure; hold on; axis square; set(fig,'color','w')
subplot(2, 2, 1);
plotAll(andyxysquare);
subplot(2, 2, 3);
 plotAll(sheelaxysquare);
subplot(2, 2, 4);
plotAll(tristanxysquare);


%% plot axis-by-axis 

tristan.tr_y1 = timerange('05-Sep-2023 19:17:56.913', '05-Sep-2023 19:17:59.794');
tristan.tr_x1 = timerange('05-Sep-2023 19:18:00.795', '05-Sep-2023 19:18:03.145');
tristan.tr_y2 = timerange('05-Sep-2023 19:18:04.146', '05-Sep-2023 19:18:06.057');
tristan.tr_x2 = timerange('05-Sep-2023 19:18:07.057', '05-Sep-2023 19:18:08.828');

andy.tr_y1 = timerange('04-Sep-2023 15:00:43.906', '04-Sep-2023 15:00:47.197');
andy.tr_x1 = timerange('04-Sep-2023 15:00:48.199', '04-Sep-2023 15:00:49.899');
andy.tr_y2 = timerange('04-Sep-2023 15:00:50.899', '04-Sep-2023 15:00:52.199');
andy.tr_x2 = timerange('04-Sep-2023 15:00:53.200', '04-Sep-2023 15:00:55.201');

sheela.tr_y1 = timerange('05-Sep-2023 16:52:59.401', '05-Sep-2023 16:53:02.362');
sheela.tr_x1 = timerange('05-Sep-2023 16:53:03.362', '05-Sep-2023 16:53:04.944');
sheela.tr_y2 = timerange('05-Sep-2023 16:53:05.943', '05-Sep-2023 16:53:07.674');
sheela.tr_x2 = timerange('05-Sep-2023 16:53:08.674', '05-Sep-2023 16:53:12.035');

plotAxisByAxis(tristanxysquare, tristan)
plotAxisByAxis(andyxysquare, andy)
plotAxisByAxis(sheelaxysquare, sheela)

%% Function


function plotAll (tabletoplot)
numRows = size(tabletoplot, 1);
stepSize = 1;
selectedIndices=[];
for i = 1:stepSize:numRows
    selectedIndices = [selectedIndices; i];
end
%plot3(tabletoplot.x(selectedIndices),tabletoplot.z(selectedIndices), tabletoplot.elapsedTime(selectedIndices), 'LineWidth', 4)
plot(tabletoplot.x(selectedIndices),tabletoplot.y(selectedIndices),'LineWidth', 3, 'Color','#bdbdbd')
hold on;
quiver(tabletoplot.x(:), tabletoplot.y(:), 10*tabletoplot.x_linear_x(:), 10*tabletoplot.x_linear_y(:), 0, 'LineWidth', 2.5, 'MaxHeadSize',0.5, 'Color','#980043');
hold on; 
end


function plotAxisByAxis(tableToPlot, timeRangeObject)
set(figure,'color','w'); hold on; axis square; 

x1_elapsedTimes = tableToPlot.elapsedTime(timeRangeObject.tr_x1);
x2_elapsedTimes = tableToPlot.elapsedTime(timeRangeObject.tr_x2);
y1_elapsedTimes = tableToPlot.elapsedTime(timeRangeObject.tr_y1);
y2_elapsedTimes = tableToPlot.elapsedTime(timeRangeObject.tr_y2);


subplot(1,2,1)
hold on; axis square;
plot(tableToPlot.elapsedTime(timeRangeObject.tr_x1),tableToPlot.x(timeRangeObject.tr_x1), 'Color', "black", 'LineWidth', 2)
plot(tableToPlot.elapsedTime(timeRangeObject.tr_x2),tableToPlot.x(timeRangeObject.tr_x2), 'Color', "black", 'LineWidth', 2)
plot(tableToPlot.elapsedTime(timeRangeObject.tr_y2),tableToPlot.y(timeRangeObject.tr_y2), 'Color', "black", 'LineWidth', 2)
plot(tableToPlot.elapsedTime(timeRangeObject.tr_y1),tableToPlot.y(timeRangeObject.tr_y1), 'Color', "black", 'LineWidth', 2)

plot([y1_elapsedTimes(1), y1_elapsedTimes(1)], [40,-40], 'Color', "green", 'LineWidth', .01)
% plot([z1_elapsedTimes(1), z1_elapsedTimes(end)], [-40,-40], 'Color', "blue", 'LineWidth', 1)
% plot([z1_elapsedTimes(1), z1_elapsedTimes(end)], [40,40], 'Color', "blue", 'LineWidth', 1)
plot([y1_elapsedTimes(end), y1_elapsedTimes(end)], [-40,40], 'Color', "green", 'LineWidth', .1)

plot([x1_elapsedTimes(1), x1_elapsedTimes(1)], [40,-40], 'Color', "red", 'LineWidth', .01)
% plot([x1_elapsedTimes(1), x1_elapsedTimes(end)], [-40,-40], 'Color', "red", 'LineWidth', 1)
% plot([x1_elapsedTimes(1), x1_elapsedTimes(end)], [40,40], 'Color', "red", 'LineWidth', 1)
plot([x1_elapsedTimes(end), x1_elapsedTimes(end)], [-40,40], 'Color', "red", 'LineWidth', .01)

plot([x2_elapsedTimes(1), x2_elapsedTimes(1)], [40,-40], 'Color', "red", 'LineWidth', .01)
% plot([x2_elapsedTimes(1), x2_elapsedTimes(end)], [-40,-40], 'Color', "red", 'LineWidth', 1)
% plot([x2_elapsedTimes(1), x2_elapsedTimes(end)], [40,40], 'Color', "red", 'LineWidth', 1)
plot([x2_elapsedTimes(end), x2_elapsedTimes(end)], [-40,40], 'Color', "red", 'LineWidth', .01)

plot([y2_elapsedTimes(1), y2_elapsedTimes(1)], [40,-40], 'Color', "green", 'LineWidth', .01)
% plot([z2_elapsedTimes(1), z2_elapsedTimes(end)], [-40,-40], 'Color', "blue", 'LineWidth', 1)
% plot([z2_elapsedTimes(1), z2_elapsedTimes(end)], [40,40], 'Color', "blue", 'LineWidth', 1)
plot([y2_elapsedTimes(end), y2_elapsedTimes(end)], [-40,40], 'Color', "green", 'LineWidth', .01)

subplot(1,2,2)
hold on; axis square;
plotAll (tableToPlot)


end




