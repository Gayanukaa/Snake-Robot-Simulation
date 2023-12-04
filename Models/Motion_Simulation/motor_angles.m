clear all;

% Joint ranges in degrees
joint1_range = 150:210;
joint2_range = -120:-60;
joint3_range = -30:30;
joint4_range = -30:30;
joint5_range = 60:120;

% Generate motor_angle vectors
motor_angle1 = [joint1_range(:); flip(joint1_range(:))];
motor_angle2 = [joint2_range(:); flip(joint2_range(:))];
motor_angle3 = [joint3_range(:); flip(joint3_range(:))];
motor_angle4 = [joint4_range(:); flip(joint4_range(:))];
motor_angle5 = [joint5_range(:); flip(joint5_range(:))];

% Display the generated vectors
disp('motor_angle1:');
disp(motor_angle1);

disp('motor_angle2:');
disp(motor_angle2);

disp('motor_angle3:');
disp(motor_angle3);

disp('motor_angle4:');
disp(motor_angle4);

disp('motor_angle5:');
disp(motor_angle5);
