% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ClassTIN.r
\name{rasterizeTIN}
\alias{rasterizeTIN}
\title{Rasterize a triangular irregular network}
\usage{
rasterizeTIN(tin, res)
}
\arguments{
\item{tin}{An object of class \code{TIN}}

\item{res}{scalar. the resolution of the rasterization}
}
\value{
A data.table containing the x, y and z coordinates of the cells
}
\description{
Rasterize a triangular irregular network
}
\details{
This function is in developpement and is currently very slow.
}
\note{
Still in developpment. Currently very slow.
}
\examples{
x = runif(20)
y = runif(20)
z = runif(20)
tin = TIN(x, y, z)
rasterTIN = rasterizeTIN(tin, 0.05)
plot(rasterTIN)
}
\seealso{
\link[lidR:TIN]{TIN}
}

