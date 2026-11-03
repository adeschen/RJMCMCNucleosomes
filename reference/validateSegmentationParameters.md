# Parameters validation for the [`segmentation`](https://adeschen.github.io/RJMCMCNucleosomes/reference/segmentation.md) function

Validation of all parameters needed by the public
[`segmentation`](https://adeschen.github.io/RJMCMCNucleosomes/reference/segmentation.md)
function.

## Usage

``` r
validateSegmentationParameters(reads, zeta = 147, delta, maxLength)
```

## Arguments

- reads:

  a `GRanges`, the reads that need to be segmented.

- zeta:

  a positive `integer` or `numeric`, the length of the nucleosomes.
  Default: 147.

- delta:

  a positive `integer` or `numeric`, the accepted range of overlapping
  section between segments. The overlapping section being `zeta` +
  `delta`.

- maxLength:

  a positive `integer` or `numeric`, the length of each segment.

## Value

`0` indicating that all parameters validations have been successful.

## Author

Astrid Deschênes, Pascal Belleau

## Examples

``` r

## Load synthetic dataset of reads
data(syntheticNucleosomeReads)

## Use dataset of reads to create GRanges object
sampleGRanges <- GRanges(seqnames = syntheticNucleosomeReads$dataIP$chr,
ranges = IRanges(start = syntheticNucleosomeReads$dataIP$start,
end = syntheticNucleosomeReads$dataIP$end),
strand = syntheticNucleosomeReads$dataIP$strand)

## The function returns 0 when all parameters are valid
RJMCMCNucleosomes:::validateSegmentationParameters(reads = sampleGRanges,
zeta = 147, delta = 30, maxLength = 12000)
#> [1] 0

## The function raises an error when at least one parameter is not valid
#\dontrun{RJMCMCNucleosomes:::validateSegmentationParameters(
#reads = c(100), zeta = 147, delta = 30, maxLength = 12000)}

#\dontrun{RJMCMCNucleosomes:::validateSegmentationParameters(
#reads = sampleGRanges, zeta = "hi", delta = 30, maxLength = 12000)}
```
