# train a naive bayes classifier with package e1071
library("e1071")

# read the train and test data
trainPath = "dataset/kddcup.data_10_percent";
testPath = "dataset/kddcup.testdata.unlabeled_10_percent"
trainData = read.csv(trainPath, header = FALSE);
testData = read.csv(testPath, header = FALSE);

# train the naive bayes classifier with train data
model <- naiveBayes(V42 ~ ., data = trainData);

# classify the test data
predict(model, trainData[1:10000, ]);
predict(model, trainData[1:10000, ], type = "raw");
pred <- predict(model, trainData[10001:494021, 1:41]);
# table(pred, trainData[, 42]);

# calculate the accuracy
count = 0;
for (i in 1: length(pred)) {
    if (pred[i] == trainData[i+10000, 42]) {
        count = count + 1;
    }
}
rate = count / length(pred);