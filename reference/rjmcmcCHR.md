# Nucleosome positioning mapping on a large segment, up to a chromosome

Use of a fully Bayesian hierarchical model for chromosome-wide profiling
of nucleosome positions based on high-throughput short-read data
(MNase-Seq data). Beware that for a genome-wide profiling, each
chromosome must be treated separately. This function is optimized to run
on an entire chromosome.

The function will process by splitting the `GRanges` of reads (as
example, the reads from a chromosome) in a `list` of smaller `GRanges`
segments that can be run by the `rjmcmc` function. All those steps are
done automatically.

## Usage

``` r
rjmcmcCHR(
  reads,
  seqName = NULL,
  zeta = 147,
  delta,
  maxLength,
  nbrIterations,
  kMax,
  lambda = 3,
  minInterval,
  maxInterval,
  minReads = 5,
  adaptIterationsToReads = TRUE,
  vSeed = -1,
  nbCores = 1,
  dirOut = "out",
  saveAsRDS = FALSE,
  saveSEG = TRUE
)
```

## Arguments

- reads:

  a `GRanges`, the forward and reverse reads that need to be segmented.

- seqName:

  a `character` string containing the label of the chromosome, present
  in the `GRanges` object, that will be used. The `NULL` value is
  accepted when only one seqname is present in the `GRanges`; the only
  seqname present will be used. Default: `NULL`.

- zeta:

  a positive `integer` or `numeric`, the length of the nucleosomes.
  Default: 147.

- delta:

  a positive `integer` or `numeric`, the accepted range of overlapping
  section between segments. The overlapping section being `zeta` +
  `delta`.

- maxLength:

  a positive `integer` or `numeric`, the length of each segment.

- nbrIterations:

  a positive `integer` or `numeric`, the number of iterations.
  Non-integer values of `nbrIterations` will be cast to `integer` and
  truncated towards zero.

- kMax:

  a positive `integer` or `numeric`, the maximum number of degrees of
  freedom per region. Non-integer values of `kMax` will be cast to
  `integer` and truncated towards zero.

- lambda:

  a positive `numeric`, the theoretical mean of the Poisson
  distribution. Default: `3L`.

- minInterval:

  a `numeric`, the minimum distance between two nucleosomes.

- maxInterval:

  a `numeric`, the maximum distance between two nucleosomes.

- minReads:

  a positive `integer` or `numeric`, the minimum number of reads in a
  potential candidate region. Non-integer values of `minReads` will be
  cast to `integer` and truncated towards zero. Default: 5.

- adaptIterationsToReads:

  a `logical` indicating if the number of iterations must be modified in
  function of the number of reads. Default: `TRUE`.

- vSeed:

  a `integer`. A seed used when reproducible results are needed. When a
  value inferior or equal to zero is given, a random integer is used.
  Default: -1.

- nbCores:

  a positive `integer`, the number of cores used to run in parallel.
  Default: 1.

- dirOut:

  a `character` string. The name of the directory where 2 directories
  are created (if they don't already exist). The directory
  "dirOut/results" contains the rjmcmc results for each segment. The
  directory "dirOut/done" contains a log file for each segment in RData
  format. If the log file for a segment is in the directory, the program
  considers that it has been processed and runs the next segment.
  Default: "out".

- saveAsRDS:

  a `logical`. When `TRUE`, a RDS file containing the complete output of
  the `rjmcmc` function is created. Default: `FALSE`.

- saveSEG:

  a `logical`. When `TRUE`, a RDS file containing the segments generated
  by
  [`segmentation`](https://adeschen.github.io/RJMCMCNucleosomes/reference/segmentation.md)
  function is saved in directory named from parameter `dirOut`. Default:
  `TRUE`.

## Value

a `list` of class "rjmcmcNucleosomesBeforeAndAfterPostTreatment"
containing:

- k a `integer`, the number of nucleosomes.

- mu a `GRanges` containing the positions of the nucleosomes and '\*' as
  strand. The `seqnames` of the `GRanges` correspond to the `seqName`
  input value. `NA` when no nucleosome is detected.

- kPost a `integer`, the number of nucleosomes after post-treatment.

- muPost a `GRanges` containing the positions of the nucleosomes after
  post-treatment and '\*' as strand. The `seqnames` of the `GRanges`
  correspond to the `seqName` input value. `NA` when no nucleosome is
  detected.

## Author

Pascal Belleau, Astrid Deschênes

## Examples

``` r

## Load synthetic dataset of reads
data(syntheticNucleosomeReads)

## Use dataset of reads to create GRanges object
sampleGRanges <- GRanges(syntheticNucleosomeReads$dataIP)

## Run nucleosome detection on the entire sample
if (FALSE) result <- rjmcmcCHR(reads = sampleGRanges, zeta = 147, delta=50,
maxLength=1200, nbrIterations = 1000, lambda = 3, kMax = 30,
minInterval = 146, maxInterval = 292, minReads = 5, vSeed = 10113,
nbCores = 2, saveAsRDS = FALSE) # \dontrun{}
```
