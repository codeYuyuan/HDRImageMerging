function [ appImageCell ] = appImage( inputCell )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    appImageCell = cell(1,size(inputCell,2));
    appImageCell{1} = zeros(size(inputCell{1}));
    
    for i=1 : size(inputCell,2)-1
        %% %% over exposure pixel labeling
        appImageCell{i} = zeros(size(inputCell{1}));
        temp1 = zeros(size(inputCell{1}));
        temp2 = zeros(size(inputCell{1}));
        [row1, column1]=find(inputCell{i} >= 250);        
        temp1(sub2ind(size(inputCell{i}), row1, column1)) = 1;
        [row2, column2]=find(inputCell{i+1} < 250);
        temp2(sub2ind(size(inputCell{i}), row2, column2)) = 1;
        temp3 = temp1.*temp2;
        [row3, column3]=find(temp3 == 1);
        appImageCell{i}(sub2ind(size(inputCell{i}), row3, column3)) = 1;
        %% deficient exposure pixel labeling
        temp4 = zeros(size(inputCell{1}));
        temp5 = zeros(size(inputCell{1}));
        [row4, column4]=find(inputCell{i} ~= 0);        
        temp4(sub2ind(size(inputCell{i}), row4, column4)) = 1;
        [row5, column5]=find(inputCell{i+1} == 0);
        temp5(sub2ind(size(inputCell{i}), row5, column5)) = 1;
        temp6 = temp4.*temp5;
        [row6, column6]=find(temp6 == 1);
        appImageCell{i}(sub2ind(size(inputCell{i}), row6, column6)) = -1;
    end        
end

