% simulateSnakeRobot.m

function simulateSnakeRobot(desiredJointAngles, segmentPositions)
    % Define simulation time
    time = 0:0.01:10;  % Modify as needed
    
    % Initialize arrays to store data for analysis
    headTo1stBodyAngles = zeros(size(time));
    tailTo4thBodyAngles = zeros(size(time));
    bodySegmentAngles = zeros(4, numel(time));
    snakePath = zeros(numel(time), 2);
    
    % Main simulation loop
    currentJointAngles = zeros(9, 1);
    for i = 1:numel(time)
        % Simulate the snake's motion and update positions
        % Example: Move each joint by a small increment based on desiredJointAngles (customize this)
        jointIncrement = 0.01;
        currentJointAngles = currentJointAngles + jointIncrement;
        
        % Calculate angles and positions for analysis
        headTo1stBodyAngles(i) = angleBetweenHeadAnd1stBody(currentJointAngles, desiredJointAngles);
        tailTo4thBodyAngles(i) = angleBetweenTailAnd4thBody(currentJointAngles, desiredJointAngles);
        bodySegmentAngles(:, i) = anglesBetweenAdjacentBodySegments(currentJointAngles);
        snakePath(i, :) = segmentPositions(1, :);
    end
    
    % Generate and display the requested graphs
    figure;

    subplot(3, 2, 1);
    plot(time, headTo1stBodyAngles);
    title('Angle between Head and 1st Body Segment');

    subplot(3, 2, 2);
    plot(time, tailTo4thBodyAngles);
    title('Angle between Tail and 4th Body Segment');

    subplot(3, 2, 3);
    plot(time, bodySegmentAngles(1, :));
    title('Angle between Body 1 and Body 2');

    subplot(3, 2, 4);
    plot(time, bodySegmentAngles(2, :));
    title('Angle between Body 2 and Body 3');

    subplot(3, 2, 5);
    plot(time, bodySegmentAngles(3, :));
    title('Angle between Body 3 and Body 4');

    subplot(3, 2, 6);
    plot(snakePath(:, 1), snakePath(:, 2));
    title('Snake Path');

    % Visualize and analyze other variables
    % ...
end

% Modify angle calculation functions to accept desiredJointAngles
% ...

function angle = angleBetweenHeadAnd1stBody(currentJointAngles, desiredJointAngles)
    % Calculate the angle between the head and the 1st body segment
    angle = currentJointAngles(1) - currentJointAngles(2) - (desiredJointAngles(1) - desiredJointAngles(2));
end

function angle = angleBetweenTailAnd4thBody(currentJointAngles, desiredJointAngles)
    % Calculate the angle between the tail and the 4th body segment
    angle = currentJointAngles(8) - currentJointAngles(9) - (desiredJointAngles(8) - desiredJointAngles(9));
end

function angles = anglesBetweenAdjacentBodySegments(currentJointAngles)
    % Calculate angles between adjacent body segments
    angles = zeros(4, 1);
    for i = 1:4
        angles(i) = currentJointAngles(2 * i) - currentJointAngles(2 * i + 1);
    end
end
