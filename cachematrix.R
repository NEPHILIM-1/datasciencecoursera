### The first function creates a special matrix that has a list with a function to set
and get the value of a matrix, and set and get the value of the inverse.

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y){
                x <<- y
                m <<- NULL
        }
        get <-function() x
        setmatrix <-function(solve) m <<- solve
        getmatrix <-function() m 
        list(set = set, get = get,
             setmatrix = setmatrix,
             getmatrix = getmatrix)
}


### The second function computes the inverse of the above special matrix. If the inverse
has already been calculated (and the matrix not changed), then the cachesolve should 
retrieve the inverse from the cache.

cacheSolve <- function(x = matrix(), ...) {
        m <- x$getmatrix()
        if(!is.null(m)){
                message("getting cached data")
                return(m)
        }
        matrix <- x$get()
        m <- solve(matrix, ...)
        x$setmatrix(m)
        m
}
