close all;
clc;
clear;
n1 = imread('result3/result5.bmp');
n2 = imread('result3/localaverage.jpg');
n3 = imread('result3/localEdgeConvolution.jpg');
n4 = imread('result3/localedge.jpg');
n5 = imread('result3/localstochastic.jpg');
n6 = imread('result3/sampling.jpg');

o1 = imread('imageset3/1.bmp');
o2 = imread('imageset3/2.bmp');
o3 = imread('imageset3/3.bmp');
o4 = imread('imageset3/4.bmp');
o5 = imread('imageset3/5.bmp');
o6 = imread('imageset3/6.bmp');
o7 = imread('imageset3/7.bmp');
o8 = imread('imageset3/8.bmp');
o9 = imread('imageset3/9.bmp');
oen1 = entropy(o1);
oen2 = entropy(o2);
oen3 = entropy(o3);
oen4 = entropy(o4);
oen5 = entropy(o5);
oen6 = entropy(o6);
oen7 = entropy(o7);
oen8 = entropy(o8);
oen9 = entropy(o9);


new1 = rgb2gray(n2);
new2 = rgb2gray(n3);
new3 = rgb2gray(n4);
new4 = rgb2gray(n5);
new5 = rgb2gray(n6);
en1 = entropy(n1);
en2 = entropy(new1);
en3 = entropy(new2);
en4 = entropy(new3);
en5 = entropy(new4);
en6 = entropy(new5);

oavegrad1 =AVEGRAD(o1);
oavegrad2 =AVEGRAD(o2);
oavegrad3 =AVEGRAD(o3);
oavegrad4 =AVEGRAD(o4);
oavegrad5 =AVEGRAD(o5);
oavegrad6 =AVEGRAD(o6);
oavegrad7 =AVEGRAD(o7);
oavegrad8 =AVEGRAD(o8);
oavegrad9 =AVEGRAD(o9);



avegrad1 =AVEGRAD(n1);
avegrad2 =AVEGRAD(new1);
avegrad3 =AVEGRAD(new2);
avegrad4 =AVEGRAD(new3);
avegrad5 =AVEGRAD(new4);
avegrad6 =AVEGRAD(new5);


files = {'imageset3/satelite001s.jpg', 'imageset3/satelite002s.jpg', 'imageset3/satelite003s.jpg','imageset3/satelite004s.jpg','imageset3/satelite005s.jpg','imageset3/satelite006s.jpg','imageset3/satelite007s.jpg','imageset3/satelite008s.jpg','imageset3/satelite009s.jpg'};
expTimes = [0.5, 0.2, 0.1, 0.05, 0.04, 0.02,0.01,0.008,0.005];
 
hdr = makehdr(files, 'RelativeExposure', expTimes ./ expTimes(1));
rgb = tonemap(hdr);

rgb2 = rgb2gray(rgb);
figure; imshow(rgb2);
enrgb2 = entropy(rgb2)
avegradrgb2 =AVEGRAD(rgb2)

