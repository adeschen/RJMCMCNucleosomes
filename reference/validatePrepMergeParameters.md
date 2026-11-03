# Parameters validation for the [`postMerge`](https://adeschen.github.io/RJMCMCNucleosomes/reference/postMerge.md) function

Validation of all parameters needed by the public
[`postMerge`](https://adeschen.github.io/RJMCMCNucleosomes/reference/postMerge.md)
function.

## Usage

``` r
validatePrepMergeParameters(
  reads,
  seqName,
  resultRJMCMC,
  extendingSize,
  chrLength
)
```

## Arguments

- reads:

  a `GRanges` containing all forward and reverse reads. The start
  positions of both reads are going to be used for the analysis. Beware
  that the start position of a reverse read is always higher than the
  end position. The `GRanges` should at least contain one read.

- seqName:

  a `character` string containing the label of the chromosome, present
  in the `GRanges` object, that will be used. The `NULL` value is
  accepted when only one seqname is present in the `GRanges`; the only
  seqname present will be used.

- resultRJMCMC:

  an object of `class` "rjmcmcNucleosomes" or "rjmcmcNucleosomesMerge"
  that contain information about nucleosome positioning for an entire
  chromosome.

- extendingSize:

  a positive `numeric` or a positive `integer` indicating the size of
  the consensus region used to group closely positioned nucleosomes. The
  minimum size of the consensus region is equal to twice the value of
  the `extendingSize` parameter. The numeric will be treated as an
  integer.

- chrLength:

  a positive `numeric` or a positive `integer` indicating the length of
  the current chromosome. The length of the chromosome is used to ensure
  that the consensus positions are all located inside the chromosome.

## Value

`0` indicating that all parameters validations have been successful.

## Author

Astrid Deschênes

## Examples

``` r

## Load dataset containing forward and reverse reads
data(reads_demo_01)

## Load dataset containing nucleosome information
file_002 <- dir(system.file("extdata", package = "RJMCMCNucleosomes"),
pattern = "RJMCMC_seg_02.RDS", full.names = TRUE)
nucleosome_info <- readRDS(file_002)

## The function returns 0 when all parameters are valid
RJMCMCNucleosomes:::validatePrepMergeParameters(reads = reads_demo_01,
seqName = "chr_SYNTHETIC", resultRJMCMC = nucleosome_info,
extendingSize = 74, chrLength = 10000000)
#> [1] 0

## The function raises an error when at least one parameter is not valid
if (FALSE) RJMCMCNucleosomes:::validatePrepMergeParameters(
reads = c(72400, 72431, 72428, 72429, 72426),
resultRJMCMC = NA, extendingSize = 74, chrLength = 10000000) # \dontrun{}
```
