poseGraph = robotics.PoseGraph;
data =  load('output_path.mat');

path = data.output_path;
N = size(path, 1);


addRelativePose(poseGraph, path{506}.');


for idx = 3 : (1135 - 504)
    past = nodes(poseGraph, idx-1);
    vec = path{idx+504}.';
    
    tx = past(1);
    ty = past(2);
    theta = - past(3);
    
    ct = cos(theta);    
    st = sin(theta);
    R  = [ct, -st; st, ct];
    
    xy = [(vec(1) - tx), (vec(2) - ty)];
    xy = xy * (R');
    
    newTheta = -angdiff(vec(3), past(3));
    
    %newTheta =  - angdiff(vec(3), past(3));
    addRelativePose(poseGraph, [xy(1) xy(2) newTheta]);
    

end

%addRelativePose(poseGraph, [1 1 0]);

%addRelativePose(poseGraph,[0,0,0],[1 0 0 1 0 1],100,1300) ;
% addRelativePose(poseGraph,[0,0,0],[1 0 0 1 0 1],500,1100) ;
% addRelativePose(poseGraph,[0,0,0],[1 0 0 1 0 1],700,900) ;
addRelativePose(poseGraph,[0,0,0],[1 0 0 1 0 1],2,631) ;

poseGraph = optimizePoseGraph(poseGraph);

show(poseGraph);
disp(poseGraph);
node = nodes(poseGraph);

 


