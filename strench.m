function [ outImage ] = strench( inImage, refImage,appImage, sortedImage)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%% input: image, its refimage and appimage, and initial sortedimage
%% output: corrected image
    outImage = zeros(size(inImage));
    global tempMat
    tempMat = ones(size(sortedImage{1}));
    tempMat2 = zeros(size(sortedImage{1}));
    for k = 1 : size(sortedImage, 2)
        [tempRow, tempColumn] = find (150 < sortedImage{k} & sortedImage{k}< 200);
        tempMat2(sub2ind(size(inImage), tempRow, tempColumn)) = 1;
        tempMat = tempMat .* tempMat2;
        
    end
    tempMat = medfilt2(tempMat,[3,3]);
    figure(7);
    imshow(tempMat);
    [row4, column4] =find(tempMat == 1);
    temp1 = zeros(size(inImage));
    
    [row1, column1]=find(appImage == 1);
    temp1(sub2ind(size(inImage), row1, column1)) = 1;
   
   
    %{
    for k = 0:max(max(refImage))-1
        [row2, column2]=find(refImage == k);
        temp2(sub2ind(size(inImage), row2, column2)) = 1;
        temp3 = temp1 .* temp2;
        [row3, column3]=find(temp3 == 1);
        proportion = searchMax(inImage, k)/searchMin(inImage,k+1);
        inImage(sub2ind(size(inImage), row3, column3)) = proportion * inImage(sub2ind(size(inImage), row3, column3));
    end
    %}
    global proportion;
    for k = 1:max(max(refImage))
        if k ==1
            temp2 = zeros(size(inImage));
            [row2, column2]=find(refImage == k);
            temp2(sub2ind(size(inImage), row2, column2)) = 1;
            temp3 = temp1 .* temp2;
            [row3, column3] =find(temp3 == 1);       
            l = length(row3);        
            baseImage = im2double(sortedImage{2});
            targetImage = im2double(sortedImage{1});
            for i = 1:l
                %%linear regression 
                sampleLength = round(length(row4)/5);
                Y = linspace(1,1,sampleLength)';
                X = linspace(1,sampleLength,sampleLength)';
                for count = 1:sampleLength
                    %random = fix((100-1)*rand(1))+1;
                    Y(count) =  targetImage(row4(count),column4(count)) / baseImage(row4(count),column4(count));
                end
                X=[ones(sampleLength,1), X];
                b= regress(Y,X);
                proportion{1}(i) = b(1);
                       
                %proportion{k}(i) = targetImage(row4(100),column4(100)) / baseImage(row4(100),column4(100));
                inImage(row3(i),column3(i)) = proportion{1}(i) * inImage(row3(i),column3(i));                
            end
            
        else
            temp2 = zeros(size(inImage));
            [row2, column2]=find(refImage == k);
            temp2(sub2ind(size(inImage), row2, column2)) = 1;
            temp3 = temp1 .* temp2;
            [row3, column3] =find(temp3 == 1);       
            l = length(row3);
            baseImage = im2double(sortedImage{k+1});
            targetImage = im2double(sortedImage{k});
            temp4 = zeros(size(inImage));
            [row4, column4]=find(refImage == k-1);
            temp4(sub2ind(size(inImage), row4, column4)) = 1;
            temp5 = temp1 .* temp4;
            [row5, column5] =find(temp5 == 1);  
            for i = 1:l
                sampleLength = round(length(row4));
                Y = linspace(1,1,sampleLength)';
                X = linspace(1,sampleLength,sampleLength)';
                for count = 1:sampleLength
                    %random = fix((100-1)*rand(1))+1;
                    Y(count) =  proportion{k-1}(1)* targetImage(row5(count),column5(count)) / baseImage(row5(count),column5(count));
                end
                X=[ones(sampleLength,1), X];
                b= regress(Y,X);
                proportion{k}(i) = b(1);
                inImage(row3(i),column3(i)) = proportion{k}(i) * inImage(row3(i),column3(i)); 
            end
        end
            
    end
    outImage = inImage;
end


