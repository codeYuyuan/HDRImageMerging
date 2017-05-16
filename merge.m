%% reset
clear all;
close all;
clc;

global proportion;
global tempMat;
inputCell = readSerial();
result = cell(1,1);
result{1} = zeros(size(inputCell{1}))
sortedCell = sortImage(inputCell);
id = cellfun('length',sortedCell);
sortedCell(id==0)=[];
refImageCell = getRefImage(sortedCell);
appImageCell = appImage(sortedCell);
resultRefImage = getRefImage(result);
resultAppImage = appImage(result);

%%put all the overexposed pixels into one matrix
for k = 1:size(sortedCell,2)-1
    [row,column] = find(appImageCell{k} == 1);
    result{1}(sub2ind(size(inputCell{1}), row, column)) = sortedCell{k+1}(sub2ind(size(inputCell{1}), row, column));
    resultRefImage{1}(sub2ind(size(inputCell{1}), row, column)) = refImageCell{k}(sub2ind(size(inputCell{1}), row, column));
    resultAppImage{1}(sub2ind(size(inputCell{1}), row, column)) = appImageCell{k}(sub2ind(size(inputCell{1}), row, column));
end

result1 = result{1};
figure(1);
imshow(result1);
refImage = resultRefImage{1};
%%correct the overexposed piexels
result2 = strench(result1,refImage,resultAppImage{1},sortedCell);
figure(2);
imshow(result2);
tempResult = double(sortedCell{1});
[row2, column2]=find(result2 == 0);
temp2 = zeros(size(tempResult));
temp2(sub2ind(size(result2), row2, column2)) = 1;
result3 = tempResult .* temp2;
result4 = ceil(result2 + result3);
figure(3);
result5 = uint8(result4/max(max(result4))*255);
imshow(result5);
entropyR = entropy(result5);
imwrite(result5,'result5.bmp');
entropy1 = entropy(inputCell{1});
entropy2 = entropy(inputCell{2});
entropy3 = entropy(inputCell{3});
entropy4 = entropy(inputCell{4});
entropy5 = entropy(inputCell{5});
%entropy6 = entropy(inputCell{6});
%entropy7 = entropy(inputCell{7});
%entropy8 = entropy(inputCell{8});
%entropy9 = entropy(inputCell{9});

%{
entropyResult = entropy(result5)
entropyS = zeros(1,size(sortedCell,2));
for k = 1 : size(sortedCell,2)
bug = sortedCell{k};
entropyS(k) = entropy(bug);
end

%{
for k2 = 1:size(sortedCell,2)-1
    [row2,column2] = find(appImageCell{k} == -1);
    result{1}(sub2ind(size(inputCell{1}), row2, column2)) = sortedCell{k}(sub2ind(size(inputCell{1}), row2, column2));
    resultRefImage{1}(sub2ind(size(inputCell{1}), row2, column2)) = refImageCell{k}(sub2ind(size(inputCell{1}), row2, column2));
    resultAppImage{1}(sub2ind(size(inputCell{1}), row2, column2)) = appImageCell{k}(sub2ind(size(inputCell{1}), row2, column2));
end






[row3,column3] = find(resultAppImage{1} ~= 1);
tempresult  = zeros(size(result1));
tempresult(sub2ind(size(inputCell{1}), row3, column3)) = 0.1 * sortedCell{1}(sub2ind(size(inputCell{1}), row3, column3));
adjust = 255/max(max(result2));
result3 = round(result2*adjust);



[row4,column4] = find(result3 == 0);
tempresult2  = zeros(size(result1));
tempresult2(sub2ind(size(inputCell{1}), row4, column4)) = sortedCell{1}(sub2ind(size(inputCell{1}), row4, column4));

figure(4);
imshow(tempresult2);
alfa = 0.2;
result3 = uint8(round(result3));
result4 = 0.4 * alfa*result3 + (1-alfa)* sortedCell{2};
figure(5);
imshow(result4);
imwrite(result4,'result4.bmp');
figure(6);
imshow(abs(resultAppImage{1}))
%}
%}






