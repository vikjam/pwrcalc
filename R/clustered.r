#' Power calculations in an experiment with group clusters.
#' 
#' @param m1 Mean of a group 1 (e.g., the control-group)
#' @param m2 Mean of a group 2 (e.g., the experimental-group)
#' @param n1 Number of obs. in group 1 (e.g., the control-group)
#' @param n2 Number of obs. in group 2 (e.g., the control-group)
#' @param sd Standard deviation of each group, i.e., sd = sd1 = sd2
#' @param sd1 Standard deviation of a group 1 (e.g., the control-group)
#' @param sd2 Standard deviation of a group 2 (e.g., the experimental-group)
#' @param sig.level significance level; default is sig.level = 0.05
#' @param power one minus the probability of type II error; default is power = 0.8
#' @return returns an object with all the study parameters
#' @importFrom magrittr %>%
#' @examples
#' twomeans(m1 = 12, m2 = 16, sd = 5) %>% clustered(obsclus = 10)
clustered <- function(twomeansStruct, obsclus = NULL, numclus = NULL) {
  if(all(is.null(obsclus), is.null(numclus))) {
    stop("Either obsclus or numclus must be specified.")
  }
  
  if(is.null(numclus)) {
    deff    <- 1 + (obsclus - 1) * rho
    n1clus  <- twomeansStruct$n1 * deff
    n2clus  <- twomeansStruct$n2 * deff
    numclus <- (n1clus + n2clus) / obsclus
    numclus <- ceiling(numclus)
  }
  
  if(is.null(obsclus)) {
    tot <- (twomeansStruct$n1 * (1 - rho) + twomeansStruct$n2 * (1 - rho)) /
           (1 - (twomeansStruct$n1 * rho / numclus) -
            (twomeansStruct$n1 * rho / numclus))
    if(tot <= 0) stop("Number of clusters is too small.")
    obsclus <- ceiling(tot / numclus)
    deff    <- 1 + (obsclus - 1) * rho
    n1clus  <- n1 * deff
    n2clus  <- n1 * deff
  }

    METHOD = "Two-sample t-test power calculation"
    NOTE   = paste("m1 and m2 are the means of group 1 and 2, respectively.",
                   "n1 and n2 are the obs. of group 1 and 2, respectively.",
                   sep = "\r\n")

    structure(list(m1                 = twomeansStruct$m1,
                   m2                   = twomeansStruct$m2,
                   "n1 (unadjusted)"    = twomeansStruct$n1,
                   "n2 (unadjusted)"    = twomeansStruct$n2,
                   rho                  = rho,
                   "Avg. per cluster"   = ,
                   "n1 (adjusted)"      = n1clus,
                   "n2 (adjusted)"      = n2clus,
                   "Min. # of clusters" = ,
                   sig.level            = sig.level,
                   power                = power,
                   alternative          = "two.sided",
                   method               = METHOD,
                   note                 = NOTE), 
                   class              = "power.htest")

}

