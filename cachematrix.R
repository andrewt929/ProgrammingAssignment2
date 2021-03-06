## This function creates a special "matrix" object that can cache its inverse.
## The function creates a special "matrix", which is really a list containing a function to
### 1) set the value of the matrix
### 2) get the value of the matrix
### 3) set the value of the inverse
### 4) get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
                m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) m <<- inverse
        getinverse <- function() m
        list(set = set, 
             get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), then cacheSolve retrieves the inverse from the cache.
## Otherwise, it calculates the inverse of the matrix using teh solve function and sets the value of the inverse in the cache via the setinverse function.
## For this assignment, assume that the matrix supplied is always invertible.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}