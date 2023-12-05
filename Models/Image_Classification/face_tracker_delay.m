%% Real-time face detection using webcam
clc;
clear;
close all;

% Create a webcam object
webcamObj = webcam();

initialSnapshot = snapshot(webcamObj);

% Create a face detector object
faceDetector = vision.CascadeObjectDetector();
faceDetector.MergeThreshold = 10;

imageHandle = imshow(initialSnapshot);

% Continuously capture frames and perform face detection
while true
    % Capture a frame from the webcam
    currentFrame = snapshot(webcamObj);

    grayFrame = rgb2gray(currentFrame);

    % Detect faces in the grayscale frame
    boundingBoxes = step(faceDetector, grayFrame);

    % Annotate the original frame with rectangles around detected faces
    annotatedFrame = insertObjectAnnotation(currentFrame, 'rectangle', boundingBoxes, 'Face');

    set(imageHandle, 'CData', annotatedFrame);
end
