## Put comments here that give an overall description of what your
## functions do

## Both functions generally follow the same structure given in the vector example
# not straying away too much both function use the inverse method taen from the matrixcalc package

library("matrixcalc") # Required package to get inverse of matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setInverse <- function(matrix.inverse) m <<- matrix.inverse
  getInverse <- function() m
  list(set = set, get = get, 
       setInverse = setInverse,
       getInverse = getInverse)
}


cacheSolve <- function(x, ...) {
  m <- x$getInverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- matrix.inverse(data, ...)
  x$setInverse(m)
  m 
}