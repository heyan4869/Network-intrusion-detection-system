fileReader <- function(path) {
    trainData = read.csv(path, header = FALSE);
    show(trainData);
    return(trainData);
}