# train a naive bayes classifier
library("e1071")

# read the train and test data
trainPath = "dataset/kddcup.data_10_percent";
testPath = "dataset/kddcup.testdata.unlabeled_10_percent"
trainData = read.csv(trainPath, header = FALSE);
testData = read.csv(testPath, header = FALSE);

# train the naive bayes classifier with train data
model <- naiveBayes(V42 ~ ., data = trainData);

# classify the test data
predict(model, testData);
predict(model, testData, type = "raw");
pred <- predict(model, trainData);
# table(pred, trainData[, 42]);

# calculate the accuracy
count = 0;
for (i in 1: length(pred)) {
    if (pred[i] == trainData[i, 42]) {
        count = count + 1;
    }
}
rate = count / length(pred);