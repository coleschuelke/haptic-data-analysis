clc; clear all;close all;
load('good_xz_squares.mat')

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

michaelaArduinoCMD = readtable('G:\My Drive\NRI_data\CSV\Michaela_003\Micheala_003-arduino-cmdNormalized.csv');
michaelaArduinoCMD.dateTime = datetime(michaelaArduinoCMD.time(:), 'InputFormat', 'yyyy/MM/dd/HH:mm:ss.SSSSSS');
michaelaArduinoCMD = removevars(michaelaArduinoCMD, "time");
michaelaArduinoCMD = renamevars(michaelaArduinoCMD, "dateTime","time");
michaelaArduinoCMD = table2timetable(michaelaArduinoCMD);

tristanArduinoCMD = readtable('G:\My Drive\NRI_data\CSV\Tristan_007\Tristan_007-arduino-cmdNormalized.csv');
tristanArduinoCMD.dateTime = datetime(tristanArduinoCMD.time(:), 'InputFormat', 'yyyy/MM/dd/HH:mm:ss.SSSSSS');
tristanArduinoCMD = removevars(tristanArduinoCMD, "time");
tristanArduinoCMD = renamevars(tristanArduinoCMD, "dateTime","time");
tristanArduinoCMD = table2timetable(tristanArduinoCMD);
%% convert to datetime
andyxzsquare.dateTime(:) = datetime(andyxzsquare.time(:), 'InputFormat', 'yyyy/MM/dd/HH:mm:ss.SSSSSS');
andyxzsquare = removevars(andyxzsquare, "time");
andyxzsquare = renamevars(andyxzsquare, "dateTime","time");
andyxzsquare = table2timetable(andyxzsquare);

michaelaxzsquare.dateTime(:) = datetime(michaelaxzsquare.time(:), 'InputFormat', 'yyyy/MM/dd/HH:mm:ss.SSSSSS');
michaelaxzsquare = removevars(michaelaxzsquare, "time");
michaelaxzsquare = renamevars(michaelaxzsquare, "dateTime","time");
michaelaxzsquare = table2timetable(michaelaxzsquare);

sheelaxzsquare.dateTime(:) = datetime(sheelaxzsquare.time(:), 'InputFormat', 'yyyy/MM/dd/HH:mm:ss.SSSSSS');
sheelaxzsquare = removevars(sheelaxzsquare, "time");
sheelaxzsquare = renamevars(sheelaxzsquare, "dateTime","time");
sheelaxzsquare = table2timetable(sheelaxzsquare);

tristanxzsquare.dateTime(:) = datetime(tristanxzsquare.time(:), 'InputFormat', 'yyyy/MM/dd/HH:mm:ss.SSSSSS');
tristanxzsquare = removevars(tristanxzsquare, "time");
tristanxzsquare = renamevars(tristanxzsquare, "dateTime","time");
tristanxzsquare = table2timetable(tristanxzsquare);

%% synchronize task data with command data

sheelaArduinoCMD = sheelaArduinoCMD(timerange(sheelaxzsquare.time(1),sheelaxzsquare.time(height(sheelaxzsquare))), :);
andyArduinoCMD = andyArduinoCMD(timerange(andyxzsquare.time(1),andyxzsquare.time(height(andyxzsquare))), :);
michaelaArduinoCMD = michaelaArduinoCMD(timerange(michaelaxzsquare.time(1),michaelaxzsquare.time(height(michaelaxzsquare))), :);
tristanArduinoCMD = tristanArduinoCMD(timerange(tristanxzsquare.time(1),tristanxzsquare.time(height(tristanxzsquare))), :);

sheelaxzsquare = synchronize(sheelaxzsquare, sheelaArduinoCMD,'regular','nearest', 'SampleRate',5);

andyxzsquare = synchronize(andyxzsquare, andyArduinoCMD,'regular','nearest', 'SampleRate',5);

michaelaxzsquare = synchronize(michaelaxzsquare, michaelaArduinoCMD,'regular','nearest', 'SampleRate',5);

tristanxzsquare = synchronize(tristanxzsquare, tristanArduinoCMD,'regular','nearest', 'SampleRate',5);

%% convert datetimes to duration

andyxzsquare.time.Format = "dd-MMM-uuuu HH:mm:ss.SSSSSS";
michaelaxzsquare.time.Format = "dd-MMM-uuuu HH:mm:ss.SSSSSS";
sheelaxzsquare.time.Format = "dd-MMM-uuuu HH:mm:ss.SSSSSS";
tristanxzsquare.time.Format = "dd-MMM-uuuu HH:mm:ss.SSSSSS";


andyxzsquare.elapsedTime(:) = andyxzsquare.time(:) - andyxzsquare.time(1);
michaelaxzsquare.elapsedTime(:) = michaelaxzsquare.time(:) - michaelaxzsquare.time(1);
sheelaxzsquare.elapsedTime(:) = sheelaxzsquare.time(:) - sheelaxzsquare.time(1);
tristanxzsquare.elapsedTime(:) = tristanxzsquare.time(:) - tristanxzsquare.time(1);

%% Filter and clean data

for i = 1:1:size(sheelaxzsquare, 1)
    if(sheelaxzsquare.x(i) < -45)
        sheelaxzsquare.x(i) = sheelaxzsquare.x(i) +40;
    end
    sheelaxzsquare.z(i) = sheelaxzsquare.z(i) -11;
end
% sheelaxzsquare.x_linear_x(1:9990) = 0;
% sheelaxzsquare.z_linear_z(1:9990) = 0;
% sheelaxzsquare.x_linear_x(10161:end) = 0;
% sheelaxzsquare.z_linear_z(10161:end) = 0;


for i = 1:1:size(michaelaxzsquare, 1)
    if(michaelaxzsquare.x(i) < -45)
        michaelaxzsquare.x(i) = michaelaxzsquare.x(i) + 55;
    end
    if(michaelaxzsquare.z(i) > 40 )
        michaelaxzsquare.z(i) = michaelaxzsquare.z(i) - 36;
    end
end
% michaelaxzsquare(13543:size(michaelaxzsquare, 1),:) = [];

%% plot all squares
fig=figure; hold on; axis square; set(fig,'color','w')
subplot(2, 2, 1);
plotAll(andyxzsquare);
subplot(2, 2, 2);
plotAll(michaelaxzsquare);
subplot(2, 2, 3);
 plotAll(sheelaxzsquare);
subplot(2, 2, 4);
plotAll(tristanxzsquare);


%% plot axis-by-axis 

tristan.tr_z1 = timerange('05-Sep-2023 19:18:32.038', '05-Sep-2023 19:18:33.679');
tristan.tr_x1 = timerange('05-Sep-2023 19:18:34.680', '05-Sep-2023 19:18:36.811');
tristan.tr_z2 = timerange('05-Sep-2023 19:18:37.811', '05-Sep-2023 19:18:40.332');
tristan.tr_x2 = timerange('05-Sep-2023 19:18:41.333', '05-Sep-2023 19:18:42.874');

andy.tr_z1 = timerange('04-Sep-2023 15:02:16.916', '04-Sep-2023 15:02:18.167');
andy.tr_x1 = timerange('04-Sep-2023 15:02:19.167', '04-Sep-2023 15:02:24.059');
andy.tr_z2 = timerange('04-Sep-2023 15:02:25.059', '04-Sep-2023 15:02:26.520');
andy.tr_x2 = timerange('04-Sep-2023 15:02:27.520', '04-Sep-2023 15:02:28.841');

sheela.tr_z1 = timerange('05-Sep-2023 16:49:31.774', '05-Sep-2023 16:49:54.724');
sheela.tr_x1 = timerange('05-Sep-2023 16:49:55.724', '05-Sep-2023 16:49:57.685');
sheela.tr_z2 = timerange('05-Sep-2023 16:49:58.686', '05-Sep-2023 16:50:00.226');
sheela.tr_x2 = timerange('05-Sep-2023 16:50:01.227', '05-Sep-2023 16:50:04.187');

michaela.tr_z1 = timerange('04-Sep-2023 18:50:53.787', '04-Sep-2023 18:50:59.088');
michaela.tr_x1 = timerange('04-Sep-2023 18:51:00.089', '04-Sep-2023 18:51:05.160');
michaela.tr_z2 = timerange('04-Sep-2023 18:51:06.161', '04-Sep-2023 18:51:07.821');
michaela.tr_x2 = timerange('04-Sep-2023 18:51:08.822', '04-Sep-2023 18:51:10.883');


plotAxisByAxis(tristanxzsquare, tristan)
plotAxisByAxis(andyxzsquare, andy)
plotAxisByAxis(sheelaxzsquare, sheela)
plotAxisByAxis(michaelaxzsquare, michaela)

%% Function


function plotAll (tabletoplot)
numRows = size(tabletoplot, 1);
stepSize = 1;
selectedIndices=[];
for i = 1:stepSize:numRows
    selectedIndices = [selectedIndices; i];
end
%plot3(tabletoplot.x(selectedIndices),tabletoplot.z(selectedIndices), tabletoplot.elapsedTime(selectedIndices), 'LineWidth', 4)
plot(tabletoplot.x(selectedIndices),tabletoplot.z(selectedIndices),'LineWidth', 3, 'Color','#bdbdbd')
hold on;
quiver(tabletoplot.x(:), tabletoplot.z(:), 10*tabletoplot.x_linear_x(:), 10*tabletoplot.x_linear_z(:), 0, 'LineWidth', 2.5, 'MaxHeadSize',0.5, 'Color','#980043');
hold on; 
end


function plotAxisByAxis(tableToPlot, timeRangeObject)
set(figure,'color','w'); hold on; axis square; 

x1_elapsedTimes = tableToPlot.elapsedTime(timeRangeObject.tr_x1);
x2_elapsedTimes = tableToPlot.elapsedTime(timeRangeObject.tr_x2);
z1_elapsedTimes = tableToPlot.elapsedTime(timeRangeObject.tr_z1);
z2_elapsedTimes = tableToPlot.elapsedTime(timeRangeObject.tr_z2);


subplot(1,2,1)
hold on; axis square;
plot(seconds(tableToPlot.elapsedTime(timeRangeObject.tr_x1)),tableToPlot.x(timeRangeObject.tr_x1), 'Color', "black", 'LineWidth', 2)
plot(seconds(tableToPlot.elapsedTime(timeRangeObject.tr_x2)),tableToPlot.x(timeRangeObject.tr_x2), 'Color', "black", 'LineWidth', 2)
plot(seconds(tableToPlot.elapsedTime(timeRangeObject.tr_z2)),tableToPlot.z(timeRangeObject.tr_z2), 'Color', "black", 'LineWidth', 2)
plot(seconds(tableToPlot.elapsedTime(timeRangeObject.tr_z1)),tableToPlot.z(timeRangeObject.tr_z1), 'Color', "black", 'LineWidth', 2)

plot([seconds(z1_elapsedTimes(1)), seconds(z1_elapsedTimes(1))], [40,-40], 'Color', "blue", 'LineWidth', .1)
% plot([z1_elapsedTimes(1), z1_elapsedTimes(end)], [-40,-40], 'Color', "blue", 'LineWidth', 1)
% plot([z1_elapsedTimes(1), z1_elapsedTimes(end)], [40,40], 'Color', "blue", 'LineWidth', 1)
plot([seconds(z1_elapsedTimes(end)), seconds(z1_elapsedTimes(end))], [-40,40], 'Color', "blue", 'LineWidth', .1)

plot([seconds(x1_elapsedTimes(1)), seconds(x1_elapsedTimes(1))], [40,-40], 'Color', "red", 'LineWidth', .1)
% plot([x1_elapsedTimes(1), x1_elapsedTimes(end)], [-40,-40], 'Color', "red", 'LineWidth', 1)
% plot([x1_elapsedTimes(1), x1_elapsedTimes(end)], [40,40], 'Color', "red", 'LineWidth', 1)
plot([seconds(x1_elapsedTimes(end)), seconds(x1_elapsedTimes(end))], [-40,40], 'Color', "red", 'LineWidth', .1)

plot([seconds(x2_elapsedTimes(1)), seconds(x2_elapsedTimes(1))], [40,-40], 'Color', "red", 'LineWidth', .1)
% plot([x2_elapsedTimes(1), x2_elapsedTimes(end)], [-40,-40], 'Color', "red", 'LineWidth', 1)
% plot([x2_elapsedTimes(1), x2_elapsedTimes(end)], [40,40], 'Color', "red", 'LineWidth', 1)
plot([seconds(x2_elapsedTimes(end)), seconds(x2_elapsedTimes(end))], [-40,40], 'Color', "red", 'LineWidth', .1)

plot([seconds(z2_elapsedTimes(1)), seconds(z2_elapsedTimes(1))], [40,-40], 'Color', "blue", 'LineWidth', .1)
% plot([z2_elapsedTimes(1), z2_elapsedTimes(end)], [-40,-40], 'Color', "blue", 'LineWidth', 1)
% plot([z2_elapsedTimes(1), z2_elapsedTimes(end)], [40,40], 'Color', "blue", 'LineWidth', 1)
plot([seconds(z2_elapsedTimes(end)), seconds(z2_elapsedTimes(end))], [-40,40], 'Color', "blue", 'LineWidth', .1)

subplot(1,2,2)
hold on; axis square;
plotAll (tableToPlot)


end




