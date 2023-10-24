% kinematics.m

function segmentPositions = kinematicModel(jointAngles)
    % Define segment length for all segments (head, body, tail)
    segmentLength = 0.05;  % 5 cm
    
    % Initialize the position of the head segment
    x_head = 0;
    y_head = 0;
    
    % Initialize the transformation matrix
    T = eye(4);  % Identity matrix
    
    % Initialize an array to store segment positions
    segmentPositions = zeros(9, 2);
    
    for i = 1:length(jointAngles)
        % Calculate the transformation matrix for each segment
        T_segment = [cos(jointAngles(i)) -sin(jointAngles(i)) 0 segmentLength;
                     sin(jointAngles(i)) cos(jointAngles(i)) 0 0;
                     0 0 1 0;
                     0 0 0 1];
        
        % Update the overall transformation matrix
        T = T * T_segment;
        
        % Calculate the position of each segment
        x_segment = x_head + T(1, 4);
        y_segment = y_head + T(2, 4);
        
        % Store the position of the segment
        segmentPositions(i, :) = [x_segment, y_segment];
    end
end
