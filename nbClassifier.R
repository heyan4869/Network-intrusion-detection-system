# train a naive bayes classifier with small portion
# of training data
library("e1071")

path = "kddcup.data_10_percent";
trainData = fileReader(path);
model <- naiveBayes(V42 ~ ., data = trainData);
predict(model, trainData[1:30,]);
predict(model, trainData[1:30,], type = "raw");
pred <- predict(model, trainData);
table(pred, trainData[, 42]);

count = 0;
for (i in 1: length(pred)) {
    if (pred[i] == trainData[i, 42]) {
        count = count + 1;
    }
}
rate = count / length(pred);