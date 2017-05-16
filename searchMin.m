function [ getMin ] = searchMin( imageMat, refRank )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%   Given an image, find the minimum value which has the specified rank
    temp = cell(1,1);
    temp{1} = imageMat;
    refTemp = getRefImage(temp);
    [row, column]=find(refTemp{1} == refRank);
    newRefImage = zeros(size(refTemp{1}));
    newRefImage(sub2ind(size(refTemp{1}), row, column)) = imageMat(sub2ind(size(refTemp{1}), row, column));
    getMin = min(min(newRefImage));
end



