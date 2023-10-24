% inverseKinematics.m

function desiredJointAngles = inverseKinematics(targetPosition)
    % Define the desired end-effector position for horizontal traversal
    x_d = targetPosition(1);
    y_d = targetPosition(2);
    
    % Define segment length (set to 5 cm)
    segmentLength = 0.05;
    
    % Initialize an array to store desired joint angles
    desiredJointAngles = zeros(9, 1);
    
    % Calculate joint angles for horizontal traversal (customize as needed)
    for i = 1:9
        if mod(i, 2) == 0
            desiredJointAngles(i) = atan2(y_d, x_d) + (-1)^(i + 1) * asin(segmentLength / norm([x_d, y_d]));
        else
            desiredJointAngles(i) = atan2(y_d, x_d) + (-1)^(i) * asin(segmentLength / norm([x_d, y_d]));
        end
    end
end
