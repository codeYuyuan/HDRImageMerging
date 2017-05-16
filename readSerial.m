function [ inputCell ] = readSerial( )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
%   This function is used to read image stream with sorted name and
%   attributes, when used, be sure to check the image property ' JPG,BMP,etc'
    I=cell(1,9);
    for i=1:9
        imageName=strcat('imageset10/',num2str(i),'.bmp');
        %I{i} = rgb2gray(imread(imageName));
        I{i} = imread(imageName);
    end
    inputCell = I;

end

