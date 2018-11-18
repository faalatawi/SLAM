function newMap = CloseLoop(bestPose, map, dearIndex)


%{
-------------------------------------------------------
step 1: Find the closest point to dear
-------------------------------------------------------
%}

closestPoint = dearIndex;
minDT = Inf;
for idx = dearIndex : -1 : 1
    dT = DiffPose(map.keyscans(idx).pose, bestPose);
    if minDT > norm(dT(1:2))
        minDT = norm(dT(1:2));
        closestPoint = idx;   
    end    
end

c = 1;

pause;
%}
%{
-------------------------------------------------------
step 2: create a PoseGraph 
-------------------------------------------------------
%}
%{
poseGraph = robotics.PoseGraph;
N = size(path, 1);

addRelativePose(poseGraph, path{2}.');

for idx = 3 : N
    past = nodes(poseGraph, idx-1);
    vec = path{idx}.';
    
    tx = past(1);
    ty = past(2);
    theta = - past(3);
    
    ct = cos(theta);    
    st = sin(theta);
    R  = [ct, -st; st, ct];
    
    xy = [(vec(1) - tx), (vec(2) - ty)];
    xy = xy * (R');
    
    newTheta = -angdiff(vec(3), past(3));
    
    addRelativePose(poseGraph, [xy(1) xy(2) newTheta]);
    
end
%}
%{
-------------------------------------------------------
step 3: add a loop to PoseGraph 
-------------------------------------------------------
%}
%{
addRelativePose(poseGraph,[0,0,0],[1 0 0 1 0 1],1,1365) ;


%{
-------------------------------------------------------
step 4: optimize the PoseGraph 
-------------------------------------------------------
%}

poseGraph = optimizePoseGraph(poseGraph);
newPath = nodes(poseGraph);

%{
-------------------------------------------------------
step 5: fix the map  
-------------------------------------------------------
%}

newMap

%}


end

