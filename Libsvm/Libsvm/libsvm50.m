trainData = 'C:\Users\samss\Desktop\Data Mining\dm\trainDataXY50.csv';
testData = 'C:\Users\samss\Desktop\Data Mining\dm\testDataXY50.csv';
testclass = 'C:\Users\samss\Desktop\Data Mining\dm\classXY50.txt';
SPECTF = csvread(trainData);
labels = SPECTF(1,:);
labels2 = labels.';
features = SPECTF(2:end,:);
features2 = features.';
features_matrix = sparse(features2);
libsvmwrite('trainData50.train',labels2,features_matrix);
SPECTF1 = csvread(testData);
labels3 = SPECTF1(1,:);
labels4 = labels3.';
features3 = SPECTF1(2:end,:);
features4 = features3.';
features_matrix2 = sparse(features4);
libsvmwrite('testData50.test',labels4,features_matrix2);


[trainlabels, trainfeatures] = libsvmread('trainData50.train');
model = svmtrain(trainlabels, trainfeatures, '-s 0 -t 0  -c 100 -b 1');
w = model.SVs' * model.sv_coef;
b = -model.rho;
if(model.Label(1) == -1)
    w = -w; b = -b;
end
[testLabel, testData] = libsvmread('testData50.test');
[predict_label, accuracy, prob_values] = svmpredict(testLabel, testData, model, '-b 1'); 
