#The point of this first function is to create four functions
#As R creates an environment when a function is called, this create four environments
# This allows the solved solution and the matrix to be stored in an environment
# different from the working environment
# this acts as the 'cache'

makeCacheMatrix <- function(x = matrix()) {
# note in creating a function, it also creates an environment (call it a)      
	
	s <- NULL
# self explanatory, reset the solution to the matrix as null
# such that when the function is run, s is not affected by the global environement
       
		set <- function(y) {
# this create a function 'set', thus a new environment (call it b) 

                x <<- y

# this assign the matrix as x in environment a

                s <<- NULL
# reset s, which may contain previous solution of the matrix in environment a
        }
        get <- function() x

# create a function which will simply return the matrix
 
        setsolve <- function(solve) s <<- solve
# assign s as solution of the matrix, in environment a

        getsolve <- function() s
# a function which will print s
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
# bunch the above as a list of output
}




# This function runs in conjunction with the makeCacheMatrix function above

cacheSolve <- function(x, ...) {

        s <- x$getsolve()
# call the getsolve function from above - as s
# note this s in getsolve was in 'environment a', this s is in a differet environment within the cacheSolve function

        if(!is.null(s)) {

# check s = does it have any value in it? (hence essential to set null as above)
# if s contains any value
                message("getting cached data")
                return(s)
        }
# simply return s
# close the programme
# if s is empty....

        data <- x$get()

# set data as x - this line calls for the function 'get' from above, which contains x
        s <- solve(data, ...)
# solve data (ie x), set this to be s, note in a different environment from 'environment a' or 'b' above.
# call this s in environment c

        x$setsolve(s)
# call the set solve function in makeCacheMatrix
# note what this would do is to assign s in enviroment c as 'solve'
# setsolve function above will put solve into s in environment 'a'

        s
#print s (in environment c)
}
