#' Concentration predictions for 1-compartmental PK model after single or multiple bolus doses
#'
#' @param t vector of time
#' @param dose dose
#' @param tau dosing interval
#' @param CL clearance
#' @param V volume of distribution
#' @param ruv residual error (list)
#' @examples
#' pk_1cmt_bolus(dose = 500, tau = 12, CL = 5, V = 50)
#' pk_1cmt_bolus(dose = 500, tau = 12, CL = 5, V = 50, t = 24)
#' pk_1cmt_bolus(
#'   dose = 500, tau = 12, CL = 5, V = 50,
#'   ruv = list(prop = 0.1, add = 0.1))
#' @export
pk_1cmt_bolus <- function(
    t = c(0:24),
    dose = 100,
    tau = 12,
    CL = 3,
    V = 30,
    ruv = NULL
  ) {
  k <- CL / V
  tmp <- c()
  dat <- data.frame(cbind(t = t, dv = 0))
  t_dos <- t %% tau
  n_dos <- floor(t/tau)
  unq_dos <- unique(n_dos) + 1
  for(i in seq(unq_dos)) {
    sel <- n_dos >= i-1
    tmp <- dat[sel,]
    tmp$t <- tmp$t - (i-1)*tau
    tmp$dv <- (dose/V)*exp(-k*tmp$t)
    dat[sel,]$dv <- dat[sel,]$dv + tmp$dv
  }
  if(!is.null(ruv)) {
    dat$dv <- add_ruv (dat$dv, ruv)
  }
  return(dat)
}
