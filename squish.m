function [ outImage ] = squish( inImage )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    inputMat = cell(1,1);
    inputMat{1} = inImage;
    temp1 = zeros(size(inImage));
    temp2 = zeros(size(inImage));
    tempAppImage= appImage(inputMat);
    [row1, column1]=find(tempAppImage{1} == 1);
    temp1(sub2ind(size(inImage), row1, column1)) = 1;
    tempRefImage = getRefImage(inputMat);
    refImage = tempRefImage{1};
    %{    
       for k = 2:max(max(refImage))
        [row2, column2]=find(refImage == k);
        temp2(sub2ind(size(inImage), row2, column2)) = 1;
        temp3 = temp1 .* temp2;
        [row3, column3]=find(temp3 == 1);
        proportion = searchMin(inImage, k-1)/searchMax(inImage,k);
        inImage(sub2ind(size(inImage), row3, column3)) = proportion * inImage(sub2ind(size(inImage), row3, column3));
    end
    %}
    
    for k = 1:max(max(refImage))
        [row2, column2]=find(refImage == k);
        temp2(sub2ind(size(inImage), row2, column2)) = 1;
        temp3 = temp1 .* temp2;
        [row3, column3]=find(temp3 == 1);
        proportion = 1/k;
        inImage(sub2ind(size(inImage), row3, column3)) = proportion * inImage(sub2ind(size(inImage), row3, column3));
    end
        
    outImage = inImage;
end

