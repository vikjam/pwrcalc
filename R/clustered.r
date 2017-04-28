#' Power calculations in an experiment with group clusters.
#' 
#' @param unclustered Results from twomeans not adjusting for clusters
#' @param rho Specifies the intraclass correlation coefficient
#' @param obsclus Observations in clusters
#' @param numclus Number of clusters
#' @return returns an object with all the study parameters
#' @importFrom magrittr %>%
#' @examples
#' library(pwrcalc)
#' twomeans(m1 = 12, m2 = 16, sd = 5) %>% clustered(obsclus = 10)
clustered <- function(unclustered, rho, obsclus = NULL, numclus = NULL) {
  if(all(is.null(obsclus), is.null(numclus))) {
    stop("Either obsclus or numclus must be specified.")
  }
  
  if(is.null(numclus)) {
    deff    <- 1 + (obsclus - 1) * rho
    n1clus  <- unclustered$n1 * deff
    n2clus  <- unclustered$n2 * deff
    numclus <- (n1clus + n2clus) / obsclus
    n1clus  <- ceiling(n1clus)
    n2clus  <- ceiling(n2clus)
  }
  
  if(is.null(obsclus)) {
    tot <- (unclustered$n1 * (1 - rho) + unclustered$n2 * (1 - rho)) /
           (1 - (unclustered$n1 * rho / numclus) -
           (unclustered$n1 * rho / numclus))
    if(tot <= 0) {
      stop("Number of clusters is too small.")
    }
    obsclus <- ceiling(tot / numclus)
    deff    <- 1 + (obsclus - 1) * rho
    n1clus  <- ceiling(unclustered$n1 * deff)
    n2clus  <- ceiling(unclustered$n2 * deff)
  }

    METHOD = "Two-sample t-test power calculation"
    NOTE   = paste("m1 and m2 are the means of group 1 and 2, respectively.",
                   "n1 and n2 are the obs. of group 1 and 2, respectively.",
                   sep = "\r\n")

    structure(list(m1                   = unclustered$m1,
                   m2                   = unclustered$m2,
                   "n1 (unadjusted)"    = unclustered$n1,
                   "n2 (unadjusted)"    = unclustered$n2,
                   "n1 (adjusted)"      = n1clus,
                   "n2 (adjusted)"      = n2clus,                   
                   rho                  = rho,
                   "Avg. per cluster"   = n1clus,
                   "Min. # of clusters" = obsclus,
                   sig.level            = unclustered$sig.level,
                   power                = unclustered$power,
                   alternative          = "two.sided",
                   method               = METHOD,
                   note                 = NOTE), 
                   class                = "power.htest")

}

