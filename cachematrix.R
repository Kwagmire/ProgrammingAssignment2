## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        # Initialize the cached inverse
        inv <- NULL
    
        # Function to set the value of the matrix
        set <- function(y) {
                x <<- y
                inv <<- NULL  # Reset the cached inverse
        }
        # Function to get the value of the matrix
        get <- function() x
        
        # Function to set the cached inverse
        setInverse <- function(inverse) inv <<- inverse
        
        # Function to get the cached inverse
        getInverse <- function() inv
        
        # Return a list of functions
        list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getInverse()
        
        # If the inverse is already cached, return it
        if (!is.null(inv)) {
                message("getting cached inverse")
                return(inv)
        }
        # Otherwise, compute the inverse
        data <- x$get()
        inv <- solve(data, ...)
        
        # Cache the inverse
        x$setInverse(inv)
        # Return the inverse
        inv
}
