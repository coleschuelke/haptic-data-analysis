
% start andy at 15::00::44
andyxysquare.dateTime = datetime(andyxysquare.time(:), 'InputFormat', 'yyyy/MM/dd/HH:mm:ss.SSSSSS');
andyxysquare = removevars(andyxysquare, "time");
andyxysquare = renamevars(andyxysquare, "dateTime","time");
andyxysquare = table2timetable(andyxysquare);
andyxysquare=synchronize(andyxysquare, andyxysquare,'regular', 'nearest', 'SampleRate', 5);
plot3(andyxysquare.x_andyxysquare(:), andyxysquare.y_andyxysquare(:), andyxysquare.time(:));

% start sheela at 16::52::59
sheelaxysquare.dateTime = datetime(sheelaxysquare.time(:), 'InputFormat', 'yyyy/MM/dd/HH:mm:ss.SSSSSS');
sheelaxysquare = removevars(sheelaxysquare, "time");
sheelaxysquare = renamevars(sheelaxysquare, "dateTime","time");
sheelaxysquare = table2timetable(sheelaxysquare);
sheelaxysquare=synchronize(sheelaxysquare, sheelaxysquare,'regular', 'nearest', 'SampleRate', 5);
plot3(sheelaxysquare.x_sheelaxysquare(:), sheelaxysquare.y_sheelaxysquare(:), sheelaxysquare.time(:));

% start tristan at 19::17::57
tristanxysquare.dateTime = datetime(tristanxysquare.time(:), 'InputFormat', 'yyyy/MM/dd/HH:mm:ss.SSSSSS');
tristanxysquare = removevars(tristanxysquare, "time");
tristanxysquare = renamevars(tristanxysquare, "dateTime","time");
tristanxysquare = table2timetable(tristanxysquare);
tristanxysquare=synchronize(tristanxysquare, tristanxysquare,'regular', 'nearest', 'SampleRate', 5);
plot3(tristanxysquare.x_tristanxysquare(:), tristanxysquare.y_tristanxysquare(:), tristanxysquare.time(:));

% already processed in .mat file
aldoxysquare.dateTime = datetime(aldoxysquare.time(:), 'InputFormat', 'yyyy/MM/dd/HH:mm:ss.SSSSSS');
aldoxysquare = removevars(aldoxysquare, "time");
aldoxysquare = renamevars(aldoxysquare, "dateTime","time");
aldoxysquare = table2timetable(aldoxysquare);
aldoxysquare=synchronize(aldoxysquare, aldoxysquare,'regular', 'nearest', 'SampleRate', 5);
plot3(aldoxysquare.x_aldoxysquare(:), aldoxysquare.y_aldoxysquare(:), aldoxysquare.time(:));


% clc; clear all;close all;
% load('good_xz_squares.mat')
% 
% %% read arduino commands
% sheelaArduinoCMD = readtable('G:\My Drive\NRI_data\CSV\Sheela_006\Sheila_006-arduino-cmdNormalized.csv');
% sheelaArduinoCMD.dateTime = datetime(sheelaArduinoCMD.time(:), 'InputFormat', 'yyyy/MM/dd/HH:mm:ss.SSSSSS');
% sheelaArduinoCMD = removevars(sheelaArduinoCMD, "time");
% sheelaArduinoCMD = renamevars(sheelaArduinoCMD, "dateTime","time");
% sheelaArduinoCMD = table2timetable(sheelaArduinoCMD);
% 
% andyArduinoCMD = readtable('G:\My Drive\NRI_data\CSV\Andy_001\Andy_001-arduino-cmdNormalized.csv');
% andyArduinoCMD.dateTime = datetime(andyArduinoCMD.time(:), 'InputFormat', 'yyyy/MM/dd/HH:mm:ss.SSSSSS');
% andyArduinoCMD = removevars(andyArduinoCMD, "time");
% andyArduinoCMD = renamevars(andyArduinoCMD, "dateTime","time");
% andyArduinoCMD = table2timetable(andyArduinoCMD);
% 
% michaelaArduinoCMD = readtable('G:\My Drive\NRI_data\CSV\Michaela_003\Micheala_003-arduino-cmdNormalized.csv');
% michaelaArduinoCMD.dateTime = datetime(michaelaArduinoCMD.time(:), 'InputFormat', 'yyyy/MM/dd/HH:mm:ss.SSSSSS');
% michaelaArduinoCMD = removevars(michaelaArduinoCMD, "time");
% michaelaArduinoCMD = renamevars(michaelaArduinoCMD, "dateTime","time");
% michaelaArduinoCMD = table2timetable(michaelaArduinoCMD);
% 
% tristanArduinoCMD = readtable('G:\My Drive\NRI_data\CSV\Tristan_007\Tristan_007-arduino-cmdNormalized.csv');
% tristanArduinoCMD.dateTime = datetime(tristanArduinoCMD.time(:), 'InputFormat', 'yyyy/MM/dd/HH:mm:ss.SSSSSS');
% tristanArduinoCMD = removevars(tristanArduinoCMD, "time");
% tristanArduinoCMD = renamevars(tristanArduinoCMD, "dateTime","time");
% tristanArduinoCMD = table2timetable(tristanArduinoCMD);
% %% convert to datetime
% andyxzsquare.dateTime(:) = datetime(andyxzsquare.time(:), 'InputFormat', 'yyyy/MM/dd/HH:mm:ss.SSSSSS');
% andyxzsquare = removevars(andyxzsquare, "time");
% andyxzsquare = renamevars(andyxzsquare, "dateTime","time");
% andyxzsquare = table2timetable(andyxzsquare);
% 
% michaelaxzsquare.dateTime(:) = datetime(michaelaxzsquare.time(:), 'InputFormat', 'yyyy/MM/dd/HH:mm:ss.SSSSSS');
% michaelaxzsquare = removevars(michaelaxzsquare, "time");
% michaelaxzsquare = renamevars(michaelaxzsquare, "dateTime","time");
% michaelaxzsquare = table2timetable(michaelaxzsquare);
% 
% sheelaxzsquare.dateTime(:) = datetime(sheelaxzsquare.time(:), 'InputFormat', 'yyyy/MM/dd/HH:mm:ss.SSSSSS');
% sheelaxzsquare = removevars(sheelaxzsquare, "time");
% sheelaxzsquare = renamevars(sheelaxzsquare, "dateTime","time");
% sheelaxzsquare = table2timetable(sheelaxzsquare);
% 
% tristanxzsquare.dateTime(:) = datetime(tristanxzsquare.time(:), 'InputFormat', 'yyyy/MM/dd/HH:mm:ss.SSSSSS');
% tristanxzsquare = removevars(tristanxzsquare, "time");
% tristanxzsquare = renamevars(tristanxzsquare, "dateTime","time");
% tristanxzsquare = table2timetable(tristanxzsquare);
% 
% %% synchronize task data with command data
% sheelaxzsquare = synchronize(sheelaxzsquare, sheelaArduinoCMD,'regular','nearest', 'SampleRate',5);
% 
% andyxzsquare = synchronize(andyxzsquare, andyArduinoCMD,'regular','nearest', 'SampleRate',5);
% 
% michaelaxzsquare = synchronize(michaelaxzsquare, michaelaArduinoCMD,'regular','nearest', 'SampleRate',5);
% 
% tristanxzsquare = synchronize(tristanxzsquare, tristanArduinoCMD,'regular','nearest', 'SampleRate',5);
% 
% %% convert datetimes to duration
% 
% andyxzsquare.elapsedTime(:) = andyxzsquare.time(:) - andyxzsquare.time(1);
% michaelaxzsquare.elapsedTime(:) = michaelaxzsquare.time(:) - michaelaxzsquare.time(1);
% sheelaxzsquare.elapsedTime(:) = sheelaxzsquare.time(:) - sheelaxzsquare.time(1);
% tristanxzsquare.elapsedTime(:) = tristanxzsquare.time(:) - tristanxzsquare.time(1);
% 
% andyxzsquare.elapsedTime.Format = "s";
% michaelaxzsquare.elapsedTime.Format = "s";
% sheelaxzsquare.elapsedTime.Format = "s";
% tristanxzsquare.elapsedTime.Format = "s";
% 
% 
% %% Filter and clean data
% 
% for i = 1:1:size(sheelaxzsquare, 1)
%     if(sheelaxzsquare.x(i) < -45)
%         sheelaxzsquare.x(i) = sheelaxzsquare.x(i) +40;
%     end
%     sheelaxzsquare.z(i) = sheelaxzsquare.z(i) -11;
% end
% % sheelaxzsquare.x_linear_x(1:9990) = 0;
% % sheelaxzsquare.z_linear_z(1:9990) = 0;
% % sheelaxzsquare.x_linear_x(10161:end) = 0;
% % sheelaxzsquare.z_linear_z(10161:end) = 0;
% 
% 
% for i = 1:1:size(michaelaxzsquare, 1)
%     if(michaelaxzsquare.x(i) < -45)
%         michaelaxzsquare.x(i) = michaelaxzsquare.x(i) + 55;
%     end
%     if(michaelaxzsquare.z(i) > 40 )
%         michaelaxzsquare.z(i) = michaelaxzsquare.z(i) - 36;
%     end
% end
% % michaelaxzsquare(13543:size(michaelaxzsquare, 1),:) = [];
% 
% %% plot all
% figure; hold on; axis equal
% subplot(2, 2, 1);
% plotAll(andyxzsquare);
% subplot(2, 2, 2);
% plotAll(michaelaxzsquare);
% subplot(2, 2, 3);
%  plotAll(sheelaxzsquare);
% subplot(2, 2, 4);
% plotAll(tristanxzsquare);
% 
% 
% function plotAll (tabletoplot)
% numRows = size(tabletoplot, 1);
% stepSize = 1;
% selectedIndices=[];
% for i = 1:stepSize:numRows
%     selectedIndices = [selectedIndices; i];
% end
% %plot3(tabletoplot.x(selectedIndices),tabletoplot.z(selectedIndices), tabletoplot.elapsedTime(selectedIndices), 'LineWidth', 4)
% plot(tabletoplot.x(selectedIndices),tabletoplot.z(selectedIndices),'LineWidth', 4)
% hold on;
% quiver(tabletoplot.x(:), tabletoplot.z(:), 10*tabletoplot.x_linear_x(:), 10*tabletoplot.x_linear_z(:), 0, 'LineWidth', 1.5, 'MaxHeadSize',0.5);
% hold on; 
% end
% 
% 
% 
% 
