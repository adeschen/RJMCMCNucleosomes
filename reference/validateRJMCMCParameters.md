# Parameters validation for the [`rjmcmc`](https://adeschen.github.io/RJMCMCNucleosomes/reference/rjmcmc.md) function

Validation of all parameters needed by the public
[`rjmcmc`](https://adeschen.github.io/RJMCMCNucleosomes/reference/rjmcmc.md)
function.

## Usage

``` r
validateRJMCMCParameters(
  reads,
  seqName,
  nbrIterations,
  kMax,
  lambda,
  minInterval,
  maxInterval,
  minReads,
  adaptIterationsToReads,
  vSeed
)
```

## Arguments

- reads:

  a `GRanges` containing all forward and reverse reads. The start
  positions of both reads are going to be used for the analysis. Beware
  that the start position of a reverse read is always higher than the
  end position.

- seqName:

  a `character` string containing the label of the chromosome, present
  in the `GRanges` object, that will be used. The `NULL` value is
  accepted when only one seqname is present in the `GRanges`; the only
  seqname present will be used.

- nbrIterations:

  a positive `integer` or `numeric`, the number of iterations.
  Non-integer values of `nbrIterations` will be cast to `integer` and
  truncated towards zero.

- kMax:

  a positive `integer` or `numeric`, the maximum number of nucleosomes
  per region. Non-integer values of `kMax` will be cast to `integer` and
  truncated towards zero.

- lambda:

  a positive `numeric`, the theoretical mean of the Poisson
  distribution.

- minInterval:

  a `numeric`, the minimum distance between two nucleosomes.

- maxInterval:

  a `numeric`, the maximum distance between two nucleosomes.

- minReads:

  a positive `integer` or `numeric`, the minimum number of reads in a
  potential candidate region. Non-integer values of `minReads` will be
  cast to `integer` and truncated towards zero.

- adaptIterationsToReads:

  a `logical` indicating if the number of iterations must be modified in
  function of the number of reads.

- vSeed:

  a `integer`. A seed used when reproducible results are needed. When a
  value inferior or equal to zero is given, a random integer is used.

## Value

`0` indicating that all parameters validations have been successful.

## Author

Astrid Deschênes

## Examples

``` r

reads <- GRanges(seqnames = Rle(c("chr1"), c(10)),
    ranges = IRanges(101:110, end = 111:120, names = head(letters, 10)),
    strand = Rle(strand(c("-", "+", "-", "+", "-")), c(1, 2, 2, 3, 2)))

## The function returns 0 when all parameters are valid
RJMCMCNucleosomes:::validateRJMCMCParameters(reads = reads,
seqName = "chr1", nbrIterations = 2, kMax = 10, lambda = 1, minReads = 1,
minInterval = 100, maxInterval = 200, adaptIterationsToReads = TRUE,
vSeed = 100)
#> [1] 0

## The function raises an error when at least one parameter is not valid
if (FALSE) RJMCMCNucleosomes:::validateRJMCMCParameters(
reads = NA, seqName = "chr1",
nbrIterations = 2, kMax = 10, lambda = 1, minReads = 1, minInterval = 100,
maxInterval = 200, adaptIterationsToReads = TRUE, vSeed = -1) # \dontrun{}
```
