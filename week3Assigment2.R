makeCacheMatrix <- function(x= matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function () x
  setInverse <- function(Inverse) m <<- Inverse
  getInverse <- function() inv
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

## the function computes the inverse of the special "matrix" by makeCasheMatrix as seen above
cacheSolve <- function(x, ...) {
  ## retunrs matrix that is the inverse of x
  inv <- x$getInverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(mat, ...)
  x$setInverse(inv)
  inv
}
