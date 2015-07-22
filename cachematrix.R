## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## This function contains the following functions:
## set,get,setInverse and getInverse
## We have used the <<- operator  
#  to assign a value to an object 
## in an environment that is different from the current environment
makeCacheMatrix <- function(x = matrix()) {
  
  # Create a "empty" inverse Matrix.This will be the place holder for the x'inverse matrix
  xInverse <- NULL
  # setter fucntion to set the matrix to be used by makeCacheMatrix function.
  set <- function(y){
    x <<- y
    xInverse <<- NULL
  }
  # getter function to return the matrix that is being used by makeCacheMatrix fucntion.
  get <- function() x
  # setter function to set the inverse 
  setInverse <- function(inverse) xInverse <<- inverse
  # getter function to set the inverse 
  getInverse <- function() xInverse
  # add these method to the environment
  list(set = set , get = get, setInverse = setInverse , getInverse = getInverse)

}


## Write a short comment describing this function

## This function computes the inverse of the square matrix
## returned by makeCacheMatrix above. If the inverse has already 
## been calculated (and the matrix has not changed), then the 
## cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
   
   inverseMatrix <- x$getInverse()
   ## If the inverse exists , then return from the cache
   if (!is.null(inverseMatrix))
   {
      message("Inverse exists in cache")
      return(inverseMatrix)
   }
   ## otherwise calculate the inverse  
   message("Calculating the inverse")
   ## get the matrix of which inverse is to be calculated.
   matrix <- x$get()
   ## Calculate the inverse of the above matrix.
   inverseMatrix <- solve(matrix)
   ## Cache the inverse matrix for future calculation.
   message("Caching the inverse")
   x$setInverse(inverseMatrix)
   inverseMatrix
}

