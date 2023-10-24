function desiredJointAngles = inverseKinematics(targetPosition)
    % Simplified control algorithm using inverse kinematics
    segmentLength = 1.0;
    x_d = targetPosition(1);
    y_d = targetPosition(2);
    
    % Calculate joint angles using inverse kinematics
    desiredJointAngles = atan2(y_d, x_d);
end
