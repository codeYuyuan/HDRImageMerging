function [ expNum ] = findExpNum( inputImage )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    expNum = sum(inputImage == 255);
end

