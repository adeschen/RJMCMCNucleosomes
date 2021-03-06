% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rjmcmcMethod.R
\name{rjmcmcCHR}
\alias{rjmcmcCHR}
\title{Nucleosome positioning mapping on a large segment, up to a chromosome}
\usage{
rjmcmcCHR(reads, seqName = NULL, zeta = 147, delta, maxLength,
  nbrIterations, kMax, lambda = 3, minInterval, maxInterval, minReads = 5,
  adaptIterationsToReads = TRUE, vSeed = -1, nbCores = 1,
  dirOut = "out", saveAsRDS = FALSE, saveSEG = TRUE)
}
\arguments{
\item{reads}{a \code{GRanges}, the forward and reverse
reads that need to be segmented.}

\item{seqName}{a \code{character} string containing the label of the
chromosome, present in the \code{GRanges} object, that will be used. The
\code{NULL} value is accepted when only one seqname is
present in the \code{GRanges}; the only seqname present will be used.
Default: \code{NULL}.}

\item{zeta}{a positive \code{integer} or \code{numeric}, the length
of the nucleosomes. Default: 147.}

\item{delta}{a positive \code{integer} or \code{numeric}, the accepted
range of overlapping section between segments. The overlapping section
being \code{zeta} + \code{delta}.}

\item{maxLength}{a positive \code{integer} or \code{numeric}, the
length of each segment.}

\item{nbrIterations}{a positive \code{integer} or \code{numeric}, the
number of iterations. Non-integer values of
\code{nbrIterations} will be casted to \code{integer} and truncated towards
zero.}

\item{kMax}{a positive \code{integer} or \code{numeric}, the maximum number
of degrees of freedom per region. Non-integer values
of \code{kMax} will be casted to \code{integer} and truncated towards zero.}

\item{lambda}{a positive \code{numeric}, the theorical mean
of the Poisson distribution. Default: 3.}

\item{minInterval}{a \code{numeric}, the minimum distance between two
nucleosomes.}

\item{maxInterval}{a \code{numeric}, the maximum distance between two
nucleosomes.}

\item{minReads}{a positive \code{integer} or \code{numeric}, the minimum
number of reads in a potential canditate region. Non-integer values
of \code{minReads} will be casted to \code{integer} and truncated towards
zero. Default: 5.}

\item{adaptIterationsToReads}{a \code{logical} indicating if the number
of iterations must be modified in function of the number of reads.
Default: \code{TRUE}.}

\item{vSeed}{a \code{integer}. A seed used when reproducible results are
needed. When a value inferior or equal to zero is given, a random integer
is used. Default: -1.}

\item{nbCores}{a positive \code{integer}, the number
of cores used to run in parallel. Default: 1.}

\item{dirOut}{a \code{character} string. The name of the directory
where 2 directories are created (if they don't already exists).
The directory "dirOut/results" contents the rjmcmc results for each segment.
The directory "dirOut/done" contents file a log file for each segment in
RData format. If the log file for a segment is in the directory,
the program considers that it is has been processed and run the next
segment. Default: "out".}

\item{saveAsRDS}{a \code{logical}. When \code{TRUE}, a RDS file containing
the complete output of the \code{rjmcmc} function is created.
Default: \code{FALSE}.}

\item{saveSEG}{a \code{logical}. When \code{TRUE}, a RDS file containing
the segments generated by  \code{\link{segmentation}} function is
saved in directory named from paramter \code{dirOut}.
Default: \code{FALSE}.}
}
\value{
a \code{list} of class
"rjmcmcNucleosomesBeforeAndAfterPostTreatment" containing:
\itemize{
    \item k a \code{integer}, the number of nucleosomes.
    \item mu a \code{GRanges} containing the positions of the nucleosomes.
    \item kPost a \code{integer}, the number of nucleosomes after
post-treatment and '*' as strand. The \code{seqnames} of the \code{GRanges}
correspond to the \code{seqName} input value. \code{NA} when no nucleosome
is detected.
    \item muPost a \code{GRanges} containing the positions of the
nucleosomes after post-treament and '*' as strand. The \code{seqnames}
of the \code{GRanges} correspond to the \code{seqName} input value.
\code{NA} when no nucleosome is detected.
}
}
\description{
Use of a fully Bayesian hierarchical model for chromosome-wide
profiling of nucleosome positions based on high-throughput short-read
data (MNase-Seq data). Beware that for a genome-wide profiling, each
chromosome must be treated separatly. This function is optimized to run
on an entire chromosome.

The function will process by splittingg the \code{GRanges} of reads
(as example, the reads from a chromosome) in a \code{list} of smaller
\code{GRanges} segments that can be run by the
\code{rjmcmc} function. All those steps are done automatically.
}
\examples{

## Load synthetic dataset of reads
data(syntheticNucleosomeReads)

## Use dataset of reads to create GRanges object
sampleGRanges <- GRanges(syntheticNucleosomeReads$dataIP)

## Run nucleosome detection on the entire sample
\dontrun{result <- rjmcmcCHR(reads = sampleGRanges, zeta = 147, delta=50,
maxLength=1200, nbrIterations = 1000, lambda = 3, kMax = 30,
minInterval = 146, maxInterval = 292, minReads = 5, vSeed = 10113,
nbCores = 2, saveAsRDS = FALSE)}

}
\author{
Pascal Belleau, Astrid Deschenes
}
