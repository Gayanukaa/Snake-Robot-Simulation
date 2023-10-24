% snake_robot_main.m

% Load SolidWorks components
headModel = vrworld('head.wrl');
bodySegmentModels = cell(4, 1);  % Array to hold 4 body segment models
for i = 1:4
    bodySegmentModels{i} = vrworld(['body_segment', num2str(i), '.wrl']);
end
tailModel = vrworld('tail.wrl');

% Define simulation parameters
initialJointAngles = zeros(9, 1);  % Initialize joint angles
desiredJointAngles = [0.1; -0.1; 0.1; -0.1; 0.1; -0.1; 0.1; -0.1; 0.1];  % Desired joint angles for horizontal traversal

% Run the Simulink model
simOut = sim('snake_robot_simulation');

% Visualize and analyze results
% Example: Extract joint angles and segment positions from simOut
jointAngles = simOut.get('jointAngles');  % Modify as needed
segmentPositions = simOut.get('segmentPositions');  % Modify as needed

% Call the simulation function to generate graphs and analyze results
simulateSnakeRobot(desiredJointAngles, segmentPositions);

% Your additional visualization and analysis code goes here
% ...
