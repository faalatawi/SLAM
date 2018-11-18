% Laser sensor's parameters
function lidar = SetLidarParameters()

lidar.angle_min = -2.351831; % -134 degree
lidar.angle_max =  2.351831; % 134 degree
lidar.angle_increment = 0.004363; % 0.5 degree
lidar.npoints   = 1079; %number of point or angles 
lidar.range_min = 0.023; %  m 
lidar.range_max = 60; % m 
lidar.scan_time = 0.025;
lidar.time_increment  = 1.736112e-05;
lidar.angles = (lidar.angle_min : lidar.angle_increment : lidar.angle_max)';