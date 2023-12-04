% Define joint ranges
joint1_range = 150:210;
joint2_range = -120:-60;
joint3_range = -30:30;
joint4_range = -30:30;
joint5_range = 60:120;

% Time vector from 0 to 600 seconds with a step size of 1 second
time = 0:1:600;

% Generate motor angles for each joint
motor_angle1 = [time', linspace(joint1_range(1), joint1_range(end), numel(time))', linspace(joint1_range(end), joint1_range(1), numel(time))'];
motor_angle2 = [time', linspace(joint2_range(1), joint2_range(end), numel(time))', linspace(joint2_range(end), joint2_range(1), numel(time))'];
motor_angle3 = [time', linspace(joint3_range(1), joint3_range(end), numel(time))', linspace(joint3_range(end), joint3_range(1), numel(time))'];
motor_angle4 = [time', linspace(joint4_range(1), joint4_range(end), numel(time))', linspace(joint4_range(end), joint4_range(1), numel(time))'];
motor_angle5 = [time', linspace(joint5_range(1), joint5_range(end), numel(time))', linspace(joint5_range(end), joint5_range(1), numel(time))'];

% Display the first few rows of each array
disp('Motor Angle 1:');
disp(motor_angle1(1:5, :));

disp('Motor Angle 2:');
disp(motor_angle2(1:5, :));

disp('Motor Angle 3:');
disp(motor_angle3(1:5, :));

disp('Motor Angle 4:');
disp(motor_angle4(1:5, :));

disp('Motor Angle 5:');
disp(motor_angle5(1:5, :));

% Plot the motor angles
figure;
subplot(2, 3, 1);
plot(motor_angle1(:, 1), motor_angle1(:, 2));
title('Motor Angle 1');

subplot(2, 3, 2);
plot(motor_angle2(:, 1), motor_angle2(:, 2));
title('Motor Angle 2');

subplot(2, 3, 3);
plot(motor_angle3(:, 1), motor_angle3(:, 2));
title('Motor Angle 3');

subplot(2, 3, 4);
plot(motor_angle4(:, 1), motor_angle4(:, 2));
title('Motor Angle 4');

subplot(2, 3, 5);
plot(motor_angle5(:, 1), motor_angle5(:, 2));
title('Motor Angle 5');
