robot = create_robot();
config1 = set_angle(robot, [0, 0, 0]);
XYZ = gCodeReader('CIRCLE.nc', 0.5, 0.5, 1, 0);

for i = 1:length(XYZ)
   PX = XYZ(i,1);
   PY = XYZ(i,2);
   PZ = XYZ(i,3); 
   [angle solinfo] = ikine(robot,[PX,PY,PZ],config1);
   config2 = set_angle(robot,angle);
   show(robot,config2);
   pause(0.0000001)
end


