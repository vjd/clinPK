% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calc_amts_for_conc.R
\name{calc_amts_for_conc}
\alias{calc_amts_for_conc}
\title{Calculate the amounts in all compartments in a compartmental PK system
based on a given concentration in the central compartment, and assuming
steady state.}
\usage{
calc_amts_for_conc(conc = 10, parameters = NULL, n_cmt = 1)
}
\arguments{
\item{conc}{concentration in central compartment}

\item{parameters}{for PK model}

\item{n_cmt}{number of compartments}
}
\description{
Calculate the amounts in all compartments in a compartmental PK system
based on a given concentration in the central compartment, and assuming
steady state.
}
\examples{
calc_amts_for_conc(conc = 10, parameters = list(CL = 5, V = 50), n_cmt = 1)
calc_amts_for_conc(
  conc = 10,
  parameters = list(CL = 5, V = 50, Q = 20, V2 = 100),
  n_cmt = 2)
calc_amts_for_conc(
  conc = 10,
  parameters = list(CL = 5, V = 50, Q = 20, V2 = 100, Q2 = 30, V3 = 200),
  n_cmt = 3)
}
