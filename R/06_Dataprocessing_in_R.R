
# DATA PROCESSING ####


________________________________
# Appending rows with cbind ####
mymat <- matrix(1:8, nrow=2, ncol=4)
rownames(mymat)

# bind a new row
mymat <- rbind(mymat, c(11, 22, 33, 44))
mymat

# another way, thanks to a vector
newrow <- c(111, 222, 333, 444)
mymat <- rbind(mymat, newrow)

rownames(mymat)


___________________________________
# Appending columns with cbind ####
mymat <- matrix(1:8, nrow=2, ncol=4)


mymat <- cbind(mymat, c(11, 22))


newcol <- c(111, 222)
mymat <- cbind(mymat, newcol)

colnames(mymat)


________________________________
# R has three class systems ####
#     S3 class
#     S4 class
#     Reference class

# create a list with required components
s <- list(name = "John", age = 21, GPA = 3.5)
# name the class appropriately (assign a new data type)
class(s) <- "student"

if (class(s) == "student") {
  print(paste("The student's name is", s$name))
}

_________________
# S3 classes ####

student <- function(n, a, g) {
  # we can add our own integrity checks
  if(g>4 || g<0) stop("GPA must be between 0 and 4")
  newstud <- list(name = n, age = a, GPA = g)
  # class can be set using class() or attr() function
  attr(newstud, "class") <- "student" # same as: class(newstud)
  newstud
}
s <- student("Roberta", 26, 3.7)


__________________
# S4 classes ####
# class definition
setClass("student", slots=list(name="character", age="numeric",
                               GPA="numeric"))
# creation of an instance
s <- new("student", name="John", age=21, GPA=3.5)
# check if an object is of some S4 class
isS4(s)

# S4 classes constructor
# class definition
student <- setClass("student", slots=list(name="character",
                                          age="numeric",
                                          GPA="numeric"))
# creation of an instance
s <- student(name="John", age=21, GPA=3.5)
# check if an object is of some S4 class
isS4(s)


# accessing slots of an S4 object
# getting the content of a slot of object s
s@name
slot(s, "name")
# setting the content of a slot
s@GPA <- 3.7
slot(s, "GPA") <- 3.7



________________________
# Reference classes ####

# the function setRefClass returns a constructor function
student <- setRefClass("student", fields = list(name = "character",
                                                age = "numeric",
                                                GPA = "numeric"))
# we can now use this constructor to create a new object
s <- student(name = "John", age = 21, GPA = 3.5)
# get/set a field value
s$name
s$GPA <- 3.7
# get information about class "student":
getClass("student")

isS4(s) # TRUE!


# create list a and assign/copy to b
a <- list("x" = 1, "y" = 2)
b <- a
# modifying b will leave a unaffected!
b$y = 3
a$y
#[1] 2
# BUT: copying a reference means both can access the same object!
a <- student(name = "John", age = 21, GPA = 3.5)
b <- a
b$name <- "Paul"
a$name
# [1] "Paul"


# create reference object a and assign a's copy to b
a <- student(name = "John", age = 21, GPA = 3.5)
b <- a$copy()
# modifying b will now NOT affect a
b$name <- "Paul"
a$name
# [1] "John"


# define a function to manipulate a reference object
changeName <- function(person, newname) {
  person$name = newname
}
# create reference class and object
student <- setRefClass("student", fields = list(name = "character",
                                                age = "numeric",
                                                GPA = "numeric"))
a <- student(name = "John", age = 21, GPA = 3.5)
# change it's name
changeName(a, "Vincent")
a$name
# [1] "Vincent"


# define a function to manipulate a reference object
changeName <- function(person, newname) {
  person@name = newname
}
# create an S4 class and object
student <- setClass("student", slots=list(name="character",
                                          age="numeric",
                                          GPA="numeric"))
a <- student(name = "John", age = 21, GPA = 3.5)
# change it's name
changeName(a, "Vincent")
a@name
# [1] "John"



________________________________
# Loading and saving R data ####
# save some arbitrary object to a binary R data file
save(myobject, file="myfile.Rdata")
# saving multiple objects
save(myobject1, myobject2, myobject3, ..., file="myfile.Rdata")
# saving all objects in memory (session image; default name: ".Rdata")
save.image(file = "myfile.RData")
# loading an R data file:
load("myfile.Rdata")





__________________________
# Vectorized operation ####

# Vector arithmetics ####
x <- 1:4
y <- 6:9
# define an empty vector of equal length
z <- numeric(length(x))
for (i in 1:length(x)) {
  z[i] <- x[i] + y[i]
}
z

z <- x + y
z


# For each index i of the vectors: twice x_i plus y_i plus 1
a <- 2*x + y + 1
# Element-wise division
x / y

# Computing the sample variance:
s2 <- sum((x-mean(x))^2) / (length(x)-1)
# actually this is easier using: var(x)

# Convert all elements of x to z-scores:
# For each index i: x[i] - mean(x), then divided by standard deviation
z <- (x - mean(x)) / sd(x)

# vectorized comparisons
x > 2


# (Element-wise) vectorized matrix operations ####

x <- matrix(1:4, 2, 2)
y <- matrix(rep(10, 4), 2, 2)

# element-wise multiplication
x * y

# element-wise division
x / y

# true matrix multiplication
x %*% y


mat1 <- matrix(1:8, nrow=2, ncol=4)
mat2 <- matrix(9:16, nrow=2, ncol=4)

mat1 + mat2

log2(mat1+mat2)

max(mat1)

mean(mat1)


# Example: z-scores ####
.....












############################################################

# 12-04 lesson ####

# Exercise 1: ####
#' In the lecture we have seen what can happen with the row names of a matrix 
#' when using \rbind to add a vector with or without a variable name .
#' .  Try the same thing with a data.frame, i.e., use rbind to add one vector without 
#'    an explicit variable name (e.g., c(1, 2, 3, 4)) and one vector with an explicit 
#'    variable name (e.g.,newrow). What do you observe? 
#'    Is it like for matrices or do you make a different observation?
#'  . Now try to add two columns to the data.frame using cbind: one without an explicit 
#'    variable name and one with an explicit variable name . what do you observe now?
#  .  [Note: always remember: matrix and data.frame are NOT the same thing, even if you fill
#     them with exactly the same data!]


df1 <- data.frame(matrix(1:12, nrow=3))

new_row <- c(1,2,3,4)
rbind(df1, new_row)

cbind(df1, c(1,2,3))

newcol <- c(1,2,3)
cbind(df1, newcol)


# Exercise 2 ####

#' S3 class
#' . Create a list object t1 with five elements named "patient" (numeric), 
#'   "type" (string), "stage"(numeric), "age" (numeric), "metastases" (logical). 
#'   If you want an example of some possible, tumor-related values, you can check 
#'   the data.frame object we have seen in a previous lecture (but here we create 
#'   a list object, not a data frame).

t1 <- list(patient=1, type='melangioma', stage=3, 'age'= 61, 'metastases'= TRUE)






