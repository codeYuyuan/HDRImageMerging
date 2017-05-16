function result=imgentropy(img)
%img必须为灰度图像（2-D）
%written by hangbing6174,CUMT
%
[M,N]=size(img);
imax=ceil(max(max(img)));
temp=zeros(1,imax);
%对图像的灰度值在[0,imax]上做统计
for m=1:M;
    for n=1:N;
        if img(m,n)==imax;
            i=imax+1;
        else
            i=fix(img(m,n))+1;
        end
        temp(i)=temp(i)+1;
    end
end
temp=temp./(M*N);
%由熵的定义做计算
resul=0;
for i=1:length(temp)
    if temp(i)==0;
        resul=resul;
    else
        resul=resul-temp(i)*log2(temp(i));
    end
end
result=resul;