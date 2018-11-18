% Faisal: transform points from (0,0) to (pose_x, pose_y) relitve to theta 
% ... notice at the start pose = [0; 0; 0] 
function tscan = Transform(scan, pose)

tx = pose(1);
ty = pose(2);
theta = pose(3);

ct = cos(theta);    
st = sin(theta);
R  = [ct, -st; st, ct];

tscan = scan * (R');
tscan(:,1) = tscan(:,1) + tx;
tscan(:,2) = tscan(:,2) + ty;