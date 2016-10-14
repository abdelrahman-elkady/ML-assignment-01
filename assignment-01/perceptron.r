options(warn = 1)
setwd("/home/kady/projects-workspace/GUC/ML/assignment-01")
data <- read.csv(file="iris_sub_21655.csv", header=TRUE, sep=",")

# Extract columns
ids <- data$sepal
sepalData <- data$petal
petalData <- data$species
speciesData <- data$X

learningRate <- 0.2

print(sepal)
