clc;
clear;

picture = imread("capture_2.png");
nnet = alexnet;
% picture = camera.snapshot;
picture = imresize(picture,[227,227]);
label = classify(nnet, picture);
image(picture);
title(upper(char(label)));
disp(char(label));
 