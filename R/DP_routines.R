# Common Differential Privacy routines
#
#
#  TODO: Let's start with a single release function first
# aim for a reprex of the early-dp-pipeline qmd
#
# Except data must NOT EVER be publicly exposed


# EVENING
# * TODO: 2D Bar Plot for showing windows of M0, M3, M6, M12

# TODO: S4 Object Creation https://www.youtube.com/watch?v=YGlse2aW5Ao

#' Release an all numeric dataset.
#'
#' @param data
#' @param epsilon (default = 1)
#' @param sensitivity (default = 1)
#' @param diffpriv_mechanism (unused)
#' @param diffpriv_pparams (unused)
#'
#' @export
#' @examples
#'
#'
release_dataset_all_numeric = function(data,
                               epsilon = 1,
                               sensitivity = 1,
                               diffpriv_mechanism=diffpriv::DPMechGaussian,
                               diffpriv_pparams=diffpriv::DPParamsEps(epsilon = 5)){

  # 1. Determine Dimensionality
  #D <- (head(data))
  D <- data
  n <- nrow(D)
  d <- ncol(D)

  # 2. Function to release dataset as dataset

  # Some funny algebra is needed here to generate a flat reponse
  f <- function(data) { #Mapping D->D
    m = as.matrix(data)
    q = c()
    for (i in seq(1:nrow(m))){
      q = c(q, m[i,])
    }
    return (q)
  }
  #f <- function(data) (data)

  #print(paste0('n:',n,',d:',d))
  #print(class(f(data)))
  #print(length(f(data)))
  #print(dim(f(data)))

  # 3. Mechanism and Parameter Choice
  diffpriv_mechanism <- diffpriv::DPMechLaplace(target = f, sensitivity = 1/n, dims=n*d ) #A very hacky way to flatten the response

  #diffpriv_mechanism <- diffpriv::DPMechGaussian(target = f)
  #distr <- function(n) rnorm(n)
  #diffpriv_mechanism <- diffpriv::sensitivitySampler(diffpriv_mechanism, oracle = distr, n = 5, gamma = 0.1)

  diffpriv_pparams <- diffpriv::DPParamsEps(epsilon = epsilon)

  # 4. Release Reponse
  r <- diffpriv::releaseResponse(diffpriv_mechanism, privacyParams = diffpriv_pparams, X = D)

  # 5. Return as matrix
  return ( matrix(r$response,nrow = n,ncol = d) )
}


#' Release one.
#'
#' @export
#' @examples
#'
#'
release_one = function(data, variable, diffpriv_mechanism, diffpriv_pparams){

  f <- function(data) data[[variable]]  ## identity

  D <- (head(DF_Biobank)) ##

  n<-nrow(D)  ## dataset size

  mechanism <- diffpriv::DPMechLaplace(target = f, sensitivity = 80/n, dims = 1 )
  pparams = diffpriv::DPParamsEps(epsilon = 5)

  r <- diffpriv::releaseResponse(mechanism, privacyParams = pparams, X = D)

  cat("DP perturbed data:", r$response,
      "\nOriginal: ", f(D))

  VISDAT <- data.frame(
    id <- 1:nrow(D),
    original <- f(D),
    privatized <- r$response
  )

}
