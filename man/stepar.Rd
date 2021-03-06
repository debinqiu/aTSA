% Generated by roxygen2 (4.0.2): do not edit by hand
\name{stepar}
\alias{stepar}
\title{Stepwise Autoregressive Model}
\usage{
stepar(y, xreg = NULL, trend = c("linear", "quadratic", "constant"),
  order = NULL, lead = 0, newx = NULL, output = TRUE, ...)
}
\arguments{
\item{y}{a numeric vector of response}

\item{xreg}{a numeric vector or matrix of exogenous input variables. The default is
\code{NULL}.}

\item{trend}{the type of trend with respective to time. The default is \code{linear}.}

\item{order}{the order to fit the AR model for residuals. The default is \code{NULL}.}

\item{lead}{the number of steps ahead for which prediction is required.
The default is \code{0}.}

\item{newx}{a matrix of new data of \code{xreg} for predictions. The default is
\code{NULL}.}

\item{output}{a logical value indicating to print the results in R console. The default is
\code{NULL}.}

\item{...}{additional arguments for \code{\link{ar}} function.}
}
\value{
A list with class "\code{stepar}" containing the following components:
\item{coef}{a estimated coefficient matrix including the t-test results.}
\item{sigma}{the square root of the estimated variance of the random error.}
\item{R.squared}{the R^2 for fitted model in the first stage.}
\item{pred}{the predictions, only available for \code{lead} > 0.}
}
\description{
Fit a stepwise autoregressive model
}
\details{
The stewise autoregressive model uses a two-stage procedure to fit time series.
The first stage is to fit a (\code{constant},\code{linear},\code{quadratic})
model with respective to time sequence:
\eqn{t = (1:n)/n}, where \eqn{n = length(y)}. If \code{xreg} is supplied,
the fitted model is updated by
\deqn{y = \mu + \beta*xreg + e[t] }
for \code{trend = "constant"}, and
\deqn{y = \mu + \beta*xreg + \alpha*t + e[t]}
for \code{trend = "linear"}, and
\deqn{y = \mu + \beta*xreg + \alpha[1]*t + \alpha[2]*t^2 + e[t]}
for \code{trend = "quadratic"}.
The second stage is to fit an autoregressive process to the residuals of the fitted
model obtained in the first stage, which is accomplished by using \code{\link{ar}} function
in \code{stats} package.
}
\note{
If \code{lead} > 0 and \code{xreg} is supplied, \code{newx} must also be
supplied in order to make a prediction. The \code{newx} must be a matrix with
the same number of columns as \code{xreg} and the number of rows being
equal to \code{lead}. The predictions should be used with cautions.
}
\examples{
x <- 5*(1:100)/100
x <- x + arima.sim(list(order = c(1,0,0),ar = 0.4),n = 100)
stepar(x)
stepar(x,order = 1)

# with xreg supplied
X <- matrix(rnorm(200),100,2)
y <- 0.1*X[,1] + 1.2*X[,2] + rnorm(100)
stepar(y,X)
# make a prediction with lead = 1; used with caution.
newdat1 <- matrix(rnorm(2),nrow = 1)
fit1 <- stepar(y,X,lead = 1,newx = newdat1,output = FALSE)
# make a prediction with lead = 2; used with caution.
newdat2 <- matrix(rnorm(4),nrow = 2)
fit2 <- stepar(y,X,lead = 2,newx = newdat2,output = FALSE)
}
\author{
Debin Qiu
}

