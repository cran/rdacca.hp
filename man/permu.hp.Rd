% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/permu.hp.r
\name{permu.hp}
\alias{permu.hp}
\title{Permutation Test of Hierarchical Partitioning for Canonical Analysis}
\usage{
permu.hp(
  dv,
  iv,
  method = c("RDA", "dbRDA", "CCA"),
  type = c("adjR2", "R2"),
  scale = FALSE,
  add = FALSE,
  sqrt.dist = FALSE,
  n.perm = 1000,
  permutations = 1000
)
}
\arguments{
\item{dv}{Response variable, either a numeric vector or a matrix. If method="dbRDA", dv should be a "dist" matrix.}

\item{iv}{Predictors (explanatory variable), either a data frame or a list of data frames. If it is a data frame, the relative importance of each column of the data frame will be evaluated; if it is a list, the relative importance of each element (matrix) will be evaluated.}

\item{method}{Type of canonical analysis used for variation partitioning, should be a character string, either "RDA", "dbRDA" or "CCA", the default is "RDA". If the response variable (dv) is a numerical vector and method="RDA", the hierarchical and variation partitioning for the classical multiple regression is implemented.}

\item{type}{The type of total explained variation, either "R2" or "adjR2", in which "R2" is unadjusted R-square and "adjR2" is adjusted R-square, the default is "adjR2". The adjusted R-square is calculated using Ezekiel's formula (Ezekiel 1930) for RDA and dbRDA, while permutation procedure is used for CCA (Peres-Neto et al. 2006).}

\item{scale}{Logical; If the columns of dv should be standardized to unit variance when method="RDA" is applied.}

\item{add}{Logical; If a constant should be added to the non-diagonal values to euclidify dissimilarities (see dbrda function in vegan for details). Choice "lingoes" (or TRUE) uses the recommended method of Legendre & Anderson (1999: "method 1") and "cailliez" uses their "method 2". The argument has an effect only when method="dbRDA".}

\item{sqrt.dist}{Logical, If the square root of dissimilarities should be taken. This often euclidifies dissimilarities. The argument has an effect only when method="dbRDA"(see dbrda function in vegan for details).}

\item{n.perm}{An integer; Number of permutations for computing the adjusted R-square for CCA. The argument has an effect only when method="CCA".}

\item{permutations}{An integer; Number of permutations for computing p value of individual contribution for the randomized dataset.}
}
\value{
a data.frame containing a summary table listing the observed individual contribution, the p value of individual contribution for the randomized dataset
}
\description{
Permutation Test of Hierarchical Partitioning for Canonical Analysis
}
\details{
This function is a permutation test of hierarchical partitioning for canonical analysis. It returns a matrix of I values (the individual contribution towards total explained variation) for all values from permutations randomizations. For each permutation, the values in each variable (i.e each column of iv) are randomized independently, and rdacca.hp is run on the randomized iv. As well as the randomized I matrix, the function returns a summary table listing the observed I values, the p value of I for the randomized dataset.
}
\examples{
library(vegan)
data(mite)
data(mite.env)
#Hellinger-transform the species dataset for RDA
mite.hel <- decostand(mite, "hellinger")
permu.hp(mite.hel,mite.env,method="RDA",type="adjR2",permutations=10)
}
\author{
{Jiangshan Lai} \email{lai@ibcas.ac.cn}
}
