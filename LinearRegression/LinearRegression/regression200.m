Xtrainfile = 'C:\Users\samss\Desktop\Data Mining\dm\trainDataXY200.txt';
Ytrainfile = 'C:\Users\samss\Desktop\Data Mining\dm\Ytrain200.txt';
testfile = 'C:\Users\samss\Desktop\Data Mining\dm\testDataX200.txt';
X=dlmread(Xtrainfile,',',[1 0 644 179]); %read from 2nd row
Y=dlmread(Ytrainfile,',',0,0);
B=pinv(X')*Y'; %(XX')^-1*X'*Y'
Ytrain=B'*X; 
%disp(Ytrain);
[Ytrainvalue,Yclass]=max(Ytrain,[],1);
Xnew=dlmread(testfile,',',0,0);
Ytest=B'*Xnew;
%disp(Ytest);
[Ytestvalue,Testclass]=max(Ytest,[],1);
disp(Testclass);
regstats(Ytestvalue,Testclass);
plot(Ytestvalue,Testclass);