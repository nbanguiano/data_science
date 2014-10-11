## The functions below enable a special functionality
## where complex properties of a matix, such as its inverse in this case,
## can be "cached", to not have to run complex calculations repetievly.
## It is based on Assignment 2's example of Courseras's rprog-003 course.

## "makeCacheMatrix()" will creates several methods to
## interact with a matrix and its inverse, and
## returns a list of these methods

makeCacheMatrix <- function(x = matrix()) {
     ## the inverse of the new matrix
     ## is set to null, i.e. not set and not cached
     inv <- NULL
     
     ## set() sets a new matrix, 
     ## and set its inverse to null, since it's a new one
     set <- function(y = matrix()) {
          x <<- y
          inv <<- NULL
     }
     
     ## get() returns the matrix
     get <- function() x
     
     ## setinv() sets the inverse of the matrix
     ## to the one passed as argument
     setinv <- function(i = matrix()) inv <<- i
     
     ## getinv() returns the inverse of the matrix
     getinv <- function() inv
     
     ## return a list of the methods
     list(set = set, get = get, setinv = setinv, getinv = getinv)
}



## "cacheSolve" will calculate and "cache" (with scope assignment)
## the inverse of a matrix. Such matrix must be of
## the type "makeCacheMatrix" because it relies on its methods

cacheSolve <- function(x = makeCacheMatrix(), ...) {
     ## if the input matrix is a normal matrix
     ## return a descriptive error message for clarity
     if (class(x) == "matrix") {
          message("cacheSolve doesn't work with normal matrices")
          message("Must input a 'makeCacheMatrix' instead")
     }
     
     ## check the inverse
     xinv <- x$getinv()
     
     ## if the inverse is already set
     ## we will return its value and exit the function
     if (!is.null(xinv)) {
          message("Iverse fetched from 'cache'")
          return(xinv)
     }
     
     ## if the inverse is NULL, we wil get the matrix
     xmat <- x$get()
     
     ## solve it to get its inverse
     xinv <- solve(xmat, ...)
     
     ## set the inverse for later use
     x$setinv(xinv)
     
     ## and return the inverse
     xinv
}