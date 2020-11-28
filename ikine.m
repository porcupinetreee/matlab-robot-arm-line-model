%Calculating the inverse kinematic of the robot to get joint angles for given position point.
%Position input is a position vector.
%
%Inverse kinematic solver algorithms: 'BFGSGradientProjection' and 'LevenbergMarquardt'
% 'BFGSGradientProjection' : Slow, better result for long distance 
% 'LevenbergMarquardt' : Fast, better result for short distance (better for trajectory)
% [angles, solinfo] = ikine(robot,position,initial_pos)

function [angles, solinfo] = ikine(robot,position,initial_pos)

target = [  1         0         0    position(1)
            0         1         0    position(2)
            0         0         1    position(3)
            0         0         0    1     ];
        
ik = inverseKinematics("RigidBodyTree", robot);
ik.SolverAlgorithm = 'BFGSGradientProjection';
% ik.SolverAlgorithm = 'LevenbergMarquardt';
ik.SolverParameters.MaxTime = 0.8;
weights = [0.25 0.25 0.25 1 1 1];
[qsol, solinfo] = ik('endeffector', target, weights, initial_pos);

angles = [qsol(1).JointPosition
qsol(2).JointPosition
qsol(3).JointPosition];

if solinfo.PoseErrorNorm > 5
    error('Given target position is out of range. Robot cannot reach that position.')
end