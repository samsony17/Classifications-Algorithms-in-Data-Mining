traindata = 'C:\Users\samss\Desktop\Data Mining\dm\Xtrain50.txt';
tclass = 'C:\Users\samss\Desktop\Data Mining\dm\classXY50.txt';
testdata = 'C:\Users\samss\Desktop\Data Mining\dm\testDataX50.txt';
X1=dlmread(testdata,',',0,0);
Y1=dlmread(traindata,',',0,0);
pclass=dlmread(tclass,',',0,0);
a=~isnan(X1);
b=~isnan(Y1);
D=abs(X1'.^2*b - 2*X1'*Y1 + a'*Y1.^2);
[sorted, indexp]=sort(D');
indexp=indexp(1:5,:);
knnc=pclass(indexp);
clabel=unique(pclass);
n=length(clabel);
for i=1:n
    counter(i,:)=sum(knnc==clabel(i));
end
[maxval, windex]=max(counter,[],1);
disp(clabel(windex));