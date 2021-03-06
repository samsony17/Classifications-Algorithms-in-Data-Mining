traindata = 'C:\Users\samss\Desktop\Data Mining\dm\trainDataXY50.txt';
trainclass = 'C:\Users\samss\Desktop\Data Mining\dm\classXY50.txt';
testdata = 'C:\Users\samss\Desktop\Data Mining\dm\testDataX50.txt';
ctest=dlmread(testdata,',',0,0);
ctrain=dlmread(traindata,',',0,0);
class=dlmread(trainclass,',',0,0);
class=class';

uqclass=unique(class);
numclass=numel(uqclass);
k=ctrain';
for j = 1:numclass
  cmean(j,:) = sum(k(class==j,2:end))/9; %mean of classes
end
cmean=cmean';
a=~isnan(ctest);
b=~isnan(cmean);
D=abs(ctest'.^2*b - 2*ctest'*cmean + a'*cmean.^2); %Euclidean distance calculation
[min, indexp]=min(D,[],2); %nearest point
disp(indexp);