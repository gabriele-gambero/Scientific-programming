
# Exercises ####

# Exercise 1 ####
round(pi, 3)

# Exercise 2 ####
?seq
seq(from=2, to=20, length.out=5)

# Exercise 3 ####
?min
?max
?mean
?rnorm
x <- rnorm(n=1000, mean=2, sd=3)
min(x)
max(x)
mean(x)
?sum
sum(x)
?log
log(x)

# Exercise 4 ####
log(0)  # -inf

# Exercise 5 ####
1/0     # inf

# Exercise 6 ####
s = "Hello world!"
as.numeric(s) # NA! NAs introduced by coersion

# Exercise 7 ####
?seq_along # it generates regular sequences
seq_along(rnorm(100)) 
seq(length=100) #Yes, same result

# Exercise 8 ####
y <- c(TRUE, FALSE, FALSE, NaN, TRUE)
# cause they are seen as numerical

# Exercise 9 ####

t<-read.table("Table9.txt", header = TRUE, sep = "\t", row.names=3)
t[1:4, 1:4] # YES!
dim(t)
nrow(t)
str(t)

t[,1]
t[,"Substitution.Type"]
t$Substitution.Type

class(t[,1])
class(t[,"Substitution.Type"])
class(t$Substitution.Type)

...


# Exercise 10 ####

t2 <- t[, seq(3,ncol(mut))]...

...

# Exercise 11 ####

myfac <- factor(c(1, 2, 3, 1, 2, 1), levels=1:4)
as.vector(myfac)
class(levels(myfac))

#' Try to set the first element of the factor to a value not present in the levels. 
#' What happens? How does the factor look like afterwards?

myfac[1] <- "sium"
myfac

as.vector(myfac)


















