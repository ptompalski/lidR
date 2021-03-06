% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/canopyMatrix.r
\name{canopyMatrix}
\alias{canopyMatrix}
\title{Local canopy surface model}
\usage{
canopyMatrix(x, y, z, res)
}
\arguments{
\item{x}{vector of x coordinates}

\item{y}{vector of y coordinates}

\item{z}{vector of z coordinates}

\item{res}{numeric. The size of the cells}
}
\value{
A matrix which is the raster of the canopy surface model
}
\description{
canopyMatrix is a reimplementation of canopyModel with the local maxium algorithm
for local analyse (e.g. in a raster) avoiding sides effect of the algorithm used to
procuce the grid. It is only usefull to compute your own metric in a fuction.
}
\examples{
LASfile <- system.file("extdata", "Megaplot.las", package="lidR")
lidar = LoadLidar(LASfile)

myClosureMetrics = function(x, y, z)
{
   canopy = canopyMatrix(x,y,z, 2)

   CC2  = canopyClosure(canopy, 2)
   CC10 = canopyClosure(canopy, 10)
   CC20 = canopyClosure(canopy, 20)

   return(list(CC2 = CC2, CC10 = CC10, CC20 = CC20))
}

closures = gridMetrics(lidar, 20, myClosureMetrics(X,Y,Z))
plot(closures, "CC2")
plot(closures, "CC10")
plot(closures, "CC20")
}
\seealso{
\link[lidR:canopyClosure]{canopyClosure}
\link[lidR:gridMetrics]{gridMetrics}
\link[lidR:cloudMetrics]{cloudMetrics}
}

