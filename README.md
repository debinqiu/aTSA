# aTSA
This is an alternative R package to analyze the time series data, especially the univariate time series. Compared with other existing functions for time series analysis, most functions in this package provide nice outputs like SAS does for time series. Several functions are exactly the same names as 'arima' procedure in SAS, such as identify, estimate, and forecast, etc. They also have the similar outputs.

# Installation
To install the stable version from CRAN, simply run the following from an R console:
```
install.packages("aTSA")
```
To install the latest development builds directly from GitHub, run this instead:
```
if (!require("devtools"))
  install.packages("devtools")
devtools::install_github("deman007/aTSA")
```
