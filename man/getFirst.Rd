% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/setGeneric.r, R/ClassLidar.r
\docType{methods}
\name{getFirst}
\alias{getFirst}
\alias{getFirst,Lidar-method}
\title{Filter first returns}
\usage{
getFirst(obj)

\S4method{getFirst}{Lidar}(obj)
}
\arguments{
\item{obj}{An object of class \code{Lidar}}
}
\value{
An object of class \code{Lidar}
}
\description{
Select only the first returns.
}
\note{
\code{getFirst(obj)} is an alias for \code{extract(obj, ReturnNumber == 1)}
}
\examples{
LASfile <- system.file("extdata", "Megaplot.las", package="lidR")

lidar = LoadLidar(LASfile)

firstReturns = lidar \%>\% getFirst
}
\seealso{
\code{\link[lidR:getFirst]{getFirst} }
\code{\link[lidR:getFirstLast]{getFirstLast} }
\code{\link[lidR:getFirstOfMany]{getFirstOfMany} }
\code{\link[lidR:getSingle]{getSingle} }
\code{\link[lidR:getLast]{getLast} }
\code{\link[lidR:getGround]{getGround} }
\code{\link[lidR:getNth]{getNth} }
\code{\link[lidR:extract]{extract} }
}

