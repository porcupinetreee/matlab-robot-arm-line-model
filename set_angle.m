% Enter angles as a vector. This function accepts 4 revolute joint angles from the
% robot.
% config = set_angle(robot,angle)

function config = set_angle(robot,angle)

config = homeConfiguration(robot);
config(1).JointPosition = angle(1);
config(2).JointPosition = angle(2);
config(3).JointPosition = angle(3);
