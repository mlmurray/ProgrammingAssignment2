## Coursera R Programming Course 
## Assignment #2 - Committed to Github
## mlmurray

####  makeCacheMatrix - This function creates a special "matrix" 
##    object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmean <- function(mean) m <<- mean
  getmean <- function() m
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
}


##### cacheSolve - This function computes the inverse of the special
##    "matrix" returned by makeCacheMatrix above. If the inverse has 
##    already been calculated (and the matrix has not changed), then 
##    cacheSolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getmean()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- mean(data, ...)
  x$setmean(m)
  m
}
