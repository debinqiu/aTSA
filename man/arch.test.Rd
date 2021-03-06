% Generated by roxygen2 (4.0.2): do not edit by hand
\name{arch.test}
\alias{arch.test}
\title{ARCH Engle's Test for Residual Heteroscedasticity}
\usage{
arch.test(object, output = TRUE)
}
\arguments{
\item{object}{an object from arima model estimated by
\code{\link{arima}} or \code{\link{estimate}} function.}

\item{output}{a logical value indicating to print the results in R console, including the
plots. The default is \code{TRUE}.}
}
\value{
A matrix with the following five columns:
\item{\code{order}}{the lag parameter to calculate the test statistics.}
\item{\code{PQ}}{the Portmanteau Q test statistic.}
\item{\code{p.value}}{the p.value for PQ test.}
\item{\code{LM}}{the Lagrange Multiplier test statistic.}
\item{\code{p.value}}{the p.value for LM test.}
}
\description{
Performs Portmanteau Q and Lagrange Multiplier tests for the null
hypothesis that the residuals of a ARIMA model are homoscedastic.
}
\details{
The ARCH Engle's test is constructed based on the fact that if the residuals
(defined as \eqn{e[t]}) are heteroscedastic, the squared residuals (\eqn{e^2[t]}) are
autocorrelated. The
first type of test is to examine whether the squares of residuals are a sequence of white
noise, which is called Portmanteau Q test and similar to the Ljung-Box test on the squared
residuals. The second type of test proposed by Engle (1982) is the Lagrange Multiplier
test which is to fit a linear regression model for the squared residuals and examine
whether the fitted model
is significant. So the null hypothesis is that the squared residuals are a sequence
of white noise, namely, the residuals are homoscedastic. The lag parameter
to calculate the test statistics is taken from an integer sequence of \eqn{1:min(24,n)} with
step 4 if \eqn{n > 25}, otherwise 2, where \eqn{n} is the number of nonmissing observations.

The plots of residuals, squared residuals, p.values of PQ and LM tests will be drawn if
\code{output = TRUE}.
}
\note{
Missing values are removed before analysis.
}
\examples{
x <- rnorm(100)
mod <- estimate(x,p = 1) # or mod <- arima(x,order = c(1,0,0))
arch.test(mod)
}
\author{
Debin Qiu
}
\references{
Engle, Robert F. (1982). Autoregressive Conditional Heteroscedasticity with Estimates
of the Variance of United Kingdom Inflation. \emph{Econometrica}, 50 (4): 987-1007.

McLeod, A. I. and W. K. Li. Diagnostic Checking ARMA Time Series Models Using
Squared-Residual Autocorrelations. \emph{Journal of Time Series Analysis}.
Vol. 4, 1983, pp. 269-273.
}

