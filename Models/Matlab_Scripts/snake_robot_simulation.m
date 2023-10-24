function [simulation_results] = snake_robot_simulation(simulation_time)

% Define the initial joint angles and velocities
joint_angles = zeros(num_segments - 1, 1);
joint_velocities = zeros(num_segments - 1, 1);

% Create a simulation loop
for i = 1:simulation_time

    % Calculate the joint torques
    joint_torques = controlSnakeRobot(joint_angles, joint_velocities);

    % Update the joint angles and velocities
    joint_angles = joint_angles + joint_velocities * dt;
    joint_velocities = joint_velocities + joint_torques / inertias * dt;
end

% Save the simulation results
simulation_results.time = 1:simulation_time;
simulation_results.joint_angles = joint_angles;

end
