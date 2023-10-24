function endEffectorPosition = kinematicModel(jointAngles)
    % Simplified kinematic model for a snake robot with four segments
    segmentLength = 1.0;
    x = 0;
    y = 0;
    
    for i = 1:length(jointAngles)
        x = x + segmentLength * cos(jointAngles(i));
        y = y + segmentLength * sin(jointAngles(i));
    end
    
    endEffectorPosition = [x, y];
end
