% simulateSnakeRobot.m

function simulateSnakeRobot(desiredJointAngles, segmentPositions)
    % Define simulation time
    time = 0:0.01:10;  % Modify as needed
    
    % Initialize arrays to store data for analysis
    headTo1stBodyAngles = zeros(size(time));
    tailTo4thBodyAngles = zeros(size(time));
    bodySegmentAngles = zeros(4, numel(time));
    snakePath = zeros(numel(time), 2);
    
    % Initialize robot state
    currentJointAngles = zeros(9, 1);
    
    % Main simulation loop
    for i = 1:numel(time)
        % Simulate the snake's motion and update positions
        % Example: Move each joint by a small increment (customize this)
        jointIncrement = 0.01;
        currentJointAngles = currentJointAngles + jointIncrement;
        
        % Assume segment positions change based on kinematics
        segmentPositions = kinematicModel(currentJointAngles);
        
        % Calculate angles and positions for analysis
        headTo1stBodyAngles(i) = angleBetweenHeadAnd1stBody(currentJointAngles);
        tailTo4thBodyAngles(i) = angleBetweenTailAnd4thBody(currentJointAngles);
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

end

function angle = angleBetweenHeadAnd1stBody(jointAngles)
    % Calculate the angle between the head and the 1st body segment
    angle = jointAngles(1) - jointAngles(2);
end

function angle = angleBetweenTailAnd4thBody(jointAngles)
    % Calculate the angle between the tail and the 4th body segment
    angle = jointAngles(8) - jointAngles(9);
end

function angles = anglesBetweenAdjacentBodySegments(jointAngles)
    % Calculate angles between adjacent body segments
    angles = zeros(4, 1);
    for i = 1:4
        angles(i) = jointAngles(2 * i) - jointAngles(2 * i + 1);
    end
end
