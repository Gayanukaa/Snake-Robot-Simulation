%% Image face detection
clc;
clear;
close all;

% Prompt user to select an image
[file, path] = uigetfile('*.*', 'Select an image');
imageLocation = strcat(path, file);

originalImage = imread(imageLocation);
grayImage = rgb2gray(originalImage);

% Create a face detector object
faceDetector = vision.CascadeObjectDetector();
faceDetector.MergeThreshold = 10;

% Detect faces in the grayscale image
boundingBox = step(faceDetector, grayImage);

% Annotate the original image with rectangles around detected faces
annotatedImage = insertObjectAnnotation(originalImage, 'Rectangle', boundingBox, 'Face');

% Detect and annotate key points (green crosses) using Min Eigen Features
keyPoints = detectMinEigenFeatures(grayImage, 'ROI', boundingBox);
annotatedImage = insertMarker(annotatedImage, keyPoints, '+', 'Color', 'green');

imshow(annotatedImage);
hold on;
plot(keyPoints.Location(:, 1), keyPoints.Location(:, 2), 'g+');
hold off;
