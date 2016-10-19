traindata = 'C:\Users\samss\Desktop\Data Mining\dm\Xtrain200.txt';
tclass = 'C:\Users\samss\Desktop\Data Mining\dm\classXY200.txt';
testdata = 'C:\Users\samss\Desktop\Data Mining\dm\testDataX200.txt';
X1=dlmread(testdata,',',0,0);
Y1=dlmread(traindata,',',0,0);
class=dlmread(tclass,',',0,0);
a=~isnan(X1);
b=~isnan(Y1);
D=abs(X1'.^2*b - 2*X1'*Y1 + a'*Y1.^2); %Euclidean distance calculation
[min, indexp]=min(D,[],2); %nearest point
disp(class(indexp));