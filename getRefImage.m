function [ refImageCell] = getRefImage( inputCell )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
%   This function is used to get the reference image, which is a mask
%   whose value in corresponding pixel is the rank of the target image in stream
    refImageCell = cell(1,size(inputCell,2));
    for i = 1:size(inputCell,2)
        refImageCell{i} = zeros(size(inputCell{1}));
        [row, column]=find(inputCell{i}>=250 );
        refImageCell{i}(sub2ind(size(refImageCell{i}), row, column)) = i;
    end


end

