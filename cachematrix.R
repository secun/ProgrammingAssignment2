## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## The following code structures and logic were influenced by 
  ## the sample code provided 
  ## https://github.com/secun/ProgrammingAssignment2
  
  makeCacheMatrix <- function(x = matrix()) {
    ## makeCacheMatrix is a function that creates a special "matrix" object 
      ## that can cache its inverse.
                m <- NULL
                set <- function(y) {
                          x <<- y
                          m <<- NULL
                  }
                get <- function() x
                setinverse <- function(solve) m <<- solve
                getinverse <- function() m
                list(set = set, get = get,
                                   setinverse = setinverse,
                                   getinverse = getinverse)
      }
        
    ## Write a short comment describing this function
      ## cacheSolve is a function that computes the inverse of the special "matrix"
      ## returned by the "makeCacheMatrix" function.  If the inverse has already 
      ## been calculated and the matrix is the same, then "cacheSolve" retrieves 
      ## the inverse of the matrix from the cache. 
      
      cacheSolve <- function(x, ...) {
                ## Return a matrix that is the inverse of 'x'
          cacheSolve <- function(x) {
                    m <- x$getinverse()
                    if(!is.null(m)) {
                              message("getting cached data")
                            return(m)
                      }
                    matrix2 <- x$get()
                    m <- solve(matrix2)
                    x$setinverse(m)
                    m
          }
      
      }