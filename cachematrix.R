## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## The following code structures and logic were influenced by 
  ## the sample code provided 
  ## https://github.com/secun/ProgrammingAssignment2
  
  makeCacheMatrix <- function(x = matrix()) {
    ## makeCacheMatrix is a function that creates a special "matrix" object 
      ## that can cache its inverse.
        inv_x <- NULL                            # First we set the inverse as null.
        set <- function(y) {
          x <<- y
          inv_x <<- NULL
        }
        get <- function() x                      # This simply stores the input matrix.
        setinv <- function(new_inv) {              # setinv will store the new inverse
          inv_x <<- new_inv
        }
        getinv <- function() inv_x               # and getinv will give us the inverse
        list(set = set, get = get,                 # Finally we get the list.
             setinv = setinv, getinv = getinv)
  }
  
        
    ## Write a short comment describing this function
      ## cacheSolve is a function that computes the inverse of the special "matrix"
      ## returned by the "makeCacheMatrix" function.  If the inverse has already 
      ## been calculated and the matrix is the same, then "cacheSolve" retrieves 
      ## the inverse of the matrix from the cache. 
      
      cacheSolve <- function(x, ...) {
                ## Return a matrix that is the inverse of 'x'
          inv_mat <- x$getinv()             # Here we get the inverse stored in the list.
          if(!is.null(inv_mat)) {
            message("getting cached inverse")
            return(inv_mat)                  # If the inverse is cached we don't need to calculate
          }                                  # that and we return the one in the list.
          data <- x$get()                   # Else we get the input matrix,
          inv_mat <- solve(data, ...)        # calculate its inverse,
          x$setinv(inv_mat)                 # and store it into the "matrix list".
          inv_mat                            # Finally we return the inverse
    }