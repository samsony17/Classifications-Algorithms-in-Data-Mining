Xtrainfile = 'C:\Users\samss\Desktop\Data Mining\dm\trainDataXY50.txt';
Ytrainfile = 'C:\Users\samss\Desktop\Data Mining\dm\Ytrain50.txt';
testfile = 'C:\Users\samss\Desktop\Data Mining\dm\testDataX50.txt';
X=dlmread(Xtrainfile,',',[1 0 644 44]); %read from 2nd row
Y=dlmread(Ytrainfile,',',0,0);
B=pinv(X')*Y'; %(XX')^-1*X'*Y'
Ytrain=B'*X; 
%disp(Ytrain);
[Ytrainvalue,Yclass]=max(Ytrain,[],1);
Xnew=dlmread(testfile,',',0,0);
Ytest=B'*Xnew;
[Ytestvalue,Testclass]=max(Ytest,[],1);
disp(Testclass);
regstats(Ytestvalue,Testclass);
plot(Ytestvalue,Testclass);