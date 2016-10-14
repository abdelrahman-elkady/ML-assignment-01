options(warn = 1)
setwd("/home/kady/projects-workspace/GUC/ML/assignment-01")
data <- read.csv(file="iris_sub_21655.csv", header=TRUE, sep=",")

# Extract columns
ids <- data$sepal
sepalData <- data$petal
petalData <- data$species
speciesData <- data$X

learningRate <- 0.2

SETOSA <- 1
VERSICOLOR <- -1

# Replace species with identifiers
speciesData <- sapply(speciesData, as.character)
speciesData[speciesData == "setosa"] <- SETOSA
speciesData[speciesData == "versicolor"] <- VERSICOLOR
speciesData <- sapply(speciesData, as.numeric)

print(speciesData)
