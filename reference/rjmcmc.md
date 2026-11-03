# Nucleosome positioning mapping on a segment

Use of a fully Bayesian hierarchical model for chromosome-wide profiling
of nucleosome positions based on high-throughput short-read data
(MNase-Seq data). Beware that for a genome-wide profiling, each
chromosome must be treated separately. This function is optimized to run
on segments that are smaller sections of the chromosome.

## Usage

``` r
rjmcmc(
  reads,
  seqName = NULL,
  nbrIterations,
  kMax,
  lambda = 3,
  minInterval,
  maxInterval,
  minReads = 5,
  adaptIterationsToReads = TRUE,
  vSeed = -1,
  saveAsRDS = FALSE
)
```

## Arguments

- reads:

  a `GRanges` containing forward and reverse reads. Beware that the
  start position of a reverse read is always higher than the end
  position.

- seqName:

  a `character` string containing the label of the chromosome, present
  in the `GRanges` object, that will be used. The `NULL` value is
  accepted when only one seqname is present in the `GRanges`; the only
  seqname present will be used. Default: `NULL`.

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
  distribution. Default: 3.

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

- saveAsRDS:

  a `logical`. When `TRUE`, a RDS file containing the complete output of
  the c++ rjmcmc() function is created. Default: `FALSE`.

## Value

a `list` of `class` "rjmcmcNucleosomes" containing:

- `call` the matched call.

- `k` a `integer`, the final estimation of the number of nucleosomes.
  `0` when no nucleosome is detected.

- `mu` a `GRanges` containing the positions of the nucleosomes and '\*'
  as strand. The `seqnames` of the `GRanges` correspond to the `seqName`
  input value. `NA` when no nucleosome is detected.

- `k_max` a `integer`, the maximum number of nucleosomes obtained during
  the iteration process. `NA` when no nucleosome is detected.

## Author

Rawane Samb, Pascal Belleau, Astrid Deschênes

## Examples

``` r

## Loading dataset
data(reads_demo_01)

## Nucleosome positioning, running both merge and split functions
result <- rjmcmc(reads = reads_demo_01, seqName = "chr_SYNTHETIC",
            nbrIterations = 1000, lambda = 2, kMax = 30,
            minInterval = 146, maxInterval = 292, minReads = 5,
            vSeed = 10113, saveAsRDS = FALSE)

## Print the final estimation of the number of nucleosomes
result$k
#> [1] 3

## Print the position of nucleosomes
result$mu
#> GRanges object with 3 ranges and 0 metadata columns:
#>            seqnames    ranges strand
#>               <Rle> <IRanges>  <Rle>
#>   [1] chr_SYNTHETIC     10081      *
#>   [2] chr_SYNTHETIC     10254      *
#>   [3] chr_SYNTHETIC     10403      *
#>   -------
#>   seqinfo: 1 sequence from an unspecified genome; no seqlengths

## Print the maximum number of nucleosomes obtained during the iteration
## process
result$k_max
#> [1] 5
```
