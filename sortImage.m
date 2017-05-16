function [ sortedCell ] = sortImage( inputCell )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%   This function is used to sort input image stream descendently with its
%   average, which represents the exposure time

%% Bubblle Sort
    for i = 1:size(inputCell,2)
        for j = 1:size(inputCell,2)-i
            if(mean2(inputCell{j}) < mean2(inputCell{j+1}))
                tempMat = inputCell{j};
                inputCell{j} = inputCell{j+1};
                inputCell{j+1} = tempMat;
            end
        end
    end
    sortedCell = cell(1,size(inputCell,2));
%% Specify the last useful image
    for k = 1:size(inputCell,2)
        sortedCell{k} = inputCell{k};
        if max(max(inputCell{k})) < 255
            break;
        end;
    end
end

