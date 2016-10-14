activationFunction <- function(val) {
  if (val > 0) {
    return(1);
  } else {
    return(-1);
  }
}

options(warn = 1)
setwd("/home/kady/projects-workspace/GUC/ML/assignment-01")
mData <- read.csv(file="iris_sub_21655.csv", header=TRUE, sep=",")

mData <- mData[sample(nrow(mData)),]


# Extract columns
ids <- mData$sepal
sepalData <- mData$petal
petalData <- mData$species
speciesData <- mData$X

# Error Tracking vector
errorValues <- vector()


learningRate <- 0.2

SETOSA <- 1
VERSICOLOR <- -1

# Replace species with identifiers
speciesData <- sapply(speciesData, as.character)
speciesData[speciesData == "setosa"] <- SETOSA
speciesData[speciesData == "versicolor"] <- VERSICOLOR
speciesData <- sapply(speciesData, as.numeric)

# weights

# w1 for sepal
w1 <- runif(1, -0.2, 0.2)

# w2 for petal
w2 <- runif(1, -0.2, 0.2)

index <- 1

classify <- function(sepalLength, petalLength) {
  pCurrent <- w1 * sepalLength + w2 * petalLength
  pActivated <- activationFunction(pCurrent)

  return(pActivated)
}

while ( index <= 100 ) {
  activated <- 0
  target <- speciesData[index]

  currentSepal <- sepalData[index]
  currentPetal <- petalData[index]

  current <- w1 * currentSepal + w2 * currentPetal
  
  errorValues <- c(errorValues, target - current)
  
  activated <- activationFunction(current)

  # Train the machine if needed
  w1 <- w1 - (learningRate * ( activated - target ) * currentSepal)
  w2 <- w2 - (learningRate * ( activated - target ) * currentPetal)

  index <- index + 1
}

plot(errorValues)

print(classify(5.4,1.7))
print(classify(6.3,4.7))
print(classify(5.1,3))
