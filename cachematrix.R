## Functions makeCacheMatrix and cacheSolve allow to cache the inverse of a 
## matrix (if the matrix has not changed), rather then compute it repeatedly.

## Function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setInverse <- function(inverseMatrix) inv <<- inverseMatrix
    getInverse <- function() inv
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}

## Function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix.
## If the inverse has already been calculated (and the matrix has not changed), 
##   then the cacheSolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
    inv <- x$getInverse()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data)
    x$setInverse(inv)

    ## Return a matrix that is the inverse of 'x'
    inv    
}
