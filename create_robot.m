function robot = create_robot()
robot = rigidBodyTree;

body1 = rigidBody('body1');
jnt1 = rigidBodyJoint('jnt1', 'revolute');
tform1 = trvec2tform([0, 0, 0]) * eul2tform([0, 0, 0], 'XYZ');
setFixedTransform(jnt1, tform1);
body1.Joint = jnt1;


body2 = rigidBody('body2');
jnt2 = rigidBodyJoint('jnt2', 'fixed');
tform2 = trvec2tform([0, 0, 5]);
setFixedTransform(jnt2, tform2);
body2.Joint = jnt2;


body3 = rigidBody('body3');
jnt3 = rigidBodyJoint('jnt3','revolute');
tform3 = trvec2tform([3, 0, 0]) * eul2tform([0, pi/2, 0],'XYZ');
setFixedTransform(jnt3, tform3);
body3.Joint = jnt3;

body4 = rigidBody('body4');
jnt4 = rigidBodyJoint('jnt4','fixed');
tform4 = trvec2tform([0, 0, 2]);
setFixedTransform(jnt4, tform4);
body4.Joint = jnt4;

body5 = rigidBody('body5');
jnt5 = rigidBodyJoint('jnt5','revolute');
tform5 = trvec2tform([-4, 0, 0]) * eul2tform([0, -pi/2, 0],'XYZ');
setFixedTransform(jnt5, tform5);
body5.Joint = jnt5;

bodyEndEffector = rigidBody('endeffector');
tform6 = trvec2tform([4, 0, 0]);
setFixedTransform(bodyEndEffector.Joint, tform6);

addBody(robot, body1, 'base');
addBody(robot, body2, 'body1');
addBody(robot, body3, 'body2');
addBody(robot, body4, 'body3');
addBody(robot, body5, 'body4');
addBody(robot, bodyEndEffector, 'body5');
