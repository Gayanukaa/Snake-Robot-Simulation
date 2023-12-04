clc;
clear;
close all;

% Define joint ranges
joint1_range = 150:210;
joint2_range = -120:-60;
joint3_range = -30:30;
joint4_range = -30:30;
joint5_range = 60:120;

% Time vector from 0 to 600 seconds with a step size of 1 second
time = 0:1:600;

% Generate motor angles for each joint
motor_angle1 = linspace(joint1_range(1), joint1_range(end), numel(time))';
motor_angle2 = linspace(joint2_range(1), joint2_range(end), numel(time))';
motor_angle3 = linspace(joint3_range(1), joint3_range(end), numel(time))';
motor_angle4 = linspace(joint4_range(1), joint4_range(end), numel(time))';
motor_angle5 = linspace(joint5_range(1), joint5_range(end), numel(time))';

% Plot joint angles
figure;

subplot(2, 3, 1);
plot(time, motor_angle1, 'r', 'LineWidth', 2);
title('Motor Angle 1');
xlabel('Time (seconds)');
ylabel('Motor Angle');

subplot(2, 3, 2);
plot(time, motor_angle2, 'g', 'LineWidth', 2);
title('Motor Angle 2');
xlabel('Time (seconds)');
ylabel('Motor Angle');

subplot(2, 3, 3);
plot(time, motor_angle3, 'b', 'LineWidth', 2);
title('Motor Angle 3');
xlabel('Time (seconds)');
ylabel('Motor Angle');

subplot(2, 3, 4);
plot(time, motor_angle4, 'k', 'LineWidth', 2);
title('Motor Angle 4');
xlabel('Time (seconds)');
ylabel('Motor Angle');

subplot(2, 3, 5);
plot(time, motor_angle5, 'm', 'LineWidth', 2);
title('Motor Angle 5');
xlabel('Time (seconds)');
ylabel('Motor Angle');

% Calculate derivatives
dt = time(2) - time(1);
motor_angle1_derivative = gradient(motor_angle1, dt);
motor_angle2_derivative = gradient(motor_angle2, dt);
motor_angle3_derivative = gradient(motor_angle3, dt);
motor_angle4_derivative = gradient(motor_angle4, dt);
motor_angle5_derivative = gradient(motor_angle5, dt);

% Plot derivatives
figure;

subplot(2, 3, 1);
plot(time, motor_angle1_derivative, 'r', 'LineWidth', 0.5);
title('Motor Angle 1 Derivative');
xlabel('Time (seconds)');
ylabel('Angle Rate');

subplot(2, 3, 2);
plot(time, motor_angle2_derivative, 'g', 'LineWidth', 0.5);
title('Motor Angle 2 Derivative');
xlabel('Time (seconds)');
ylabel('Angle Rate');

subplot(2, 3, 3);
plot(time, motor_angle3_derivative, 'b', 'LineWidth', 0.5);
title('Motor Angle 3 Derivative');
xlabel('Time (seconds)');
ylabel('Angle Rate');

subplot(2, 3, 4);
plot(time, motor_angle4_derivative, 'k', 'LineWidth', 0.5);
title('Motor Angle 4 Derivative');
xlabel('Time (seconds)');
ylabel('Angle Rate');

subplot(2, 3, 5);
plot(time, motor_angle5_derivative, 'm', 'LineWidth', 0.5);
title('Motor Angle 5 Derivative');
xlabel('Time (seconds)');
ylabel('Angle Rate');

% Plot combined variation of motor angles
figure;

plot(time, motor_angle1, 'r', 'LineWidth', 1.5, 'DisplayName', 'Motor 1');
hold on;
plot(time, motor_angle2, 'g', 'LineWidth', 1.5, 'DisplayName', 'Motor 2');
plot(time, motor_angle3, 'o-', 'LineWidth', 1.5, 'DisplayName', 'Motor 3');
plot(time, motor_angle4, 'k', 'LineWidth', 1.5, 'DisplayName', 'Motor 4');
plot(time, motor_angle5, 'm', 'LineWidth', 1.5, 'DisplayName', 'Motor 5');

title('Combined Variation of Motor Angles');
xlabel('Time (seconds)');
ylabel('Motor Angle');
legend('Location', 'Best');
grid on;
hold off;
