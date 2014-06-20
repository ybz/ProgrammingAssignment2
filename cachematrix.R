## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## This function take a matrix and returns a list object the has 4 functions in it:
## set - set the matrix and reset the cache
## get - get the matrix itself
## setInverse - set the inverse of the matrix for caching
## getInverse - get the cached inverse of the matrix

makeCacheMatrix <- function(matrixVal = matrix()) {
    inverseCache <- NULL
    set <- function(m) {
        matrixVal <<- m
        inverseCache <<- NULL
    }
    get <- function() {
        matrixVal
    }
    setInverse <- function(inv) {
        inverseCache <<- inv
    }
    getInverse <- function() {
        inverseCache
    }
    list(set=set, get=get,
         setInverse=setInverse,
         getInverse=getInverse)
}


## Write a short comment describing this function
## input - object created by makeCacheMatrix
## output - the inverse of the matrix stored in the object
## 
## if the inverse is cached it will return the cached copy,
## if not, it will compute if and store in on the object

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i <- x$getInverse()
        if (is.null(i)) {
            ## no cache, solve inverse a store in cache
            i <- solve(x$get())
            x$setInverse(i)
        }
        i
}
