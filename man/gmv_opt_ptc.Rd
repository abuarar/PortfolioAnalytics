% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/optFUN.R
\name{gmv_opt_ptc}
\alias{gmv_opt_ptc}
\title{GMV/QU QP Optimization with Proportional Transaction Cost Constraint}
\usage{
gmv_opt_ptc(R, constraints, moments, lambda, target, init_weights,
  solver = "quadprog", control = NULL)
}
\arguments{
\item{R}{xts object of asset returns}

\item{constraints}{object of constraints in the portfolio object extracted with \code{get_constraints}}

\item{moments}{object of moments computed based on objective functions}

\item{lambda}{risk_aversion parameter}

\item{target}{target return value}

\item{init_weights}{initial weights to compute turnover}

\item{solver}{solver to use}

\item{control}{list of solver control parameters}
}
\description{
This function is called by optimize.portfolio to solve minimum variance or 
maximum quadratic utility problems with proportional transaction cost constraint
}
\author{
Ross Bennett
}
