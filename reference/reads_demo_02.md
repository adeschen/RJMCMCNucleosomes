# Forward reads and reverse reads in `GRanges` format (for demo purpose).

A group of forward and reverse reads that can be used to test the
`rjmcmc` function.

## Usage

``` r
data(reads_demo_02)
```

## Format

A `GRanges` containing forward and reverse reads.

## Value

A `GRanges` containing forward and reverse reads.

## See also

- [`rjmcmc`](https://adeschen.github.io/RJMCMCNucleosomes/reference/rjmcmc.md)
  for profiling of nucleosome positions

- [`rjmcmcCHR`](https://adeschen.github.io/RJMCMCNucleosomes/reference/rjmcmcCHR.md)
  for profiling of nucleosome positions for a large region. The function
  will take care of splitting and merging

- [`segmentation`](https://adeschen.github.io/RJMCMCNucleosomes/reference/segmentation.md)
  for splitting a `GRanges` containing reads in a list of smaller
  segments for the `rjmcmc` function

- [`postTreatment`](https://adeschen.github.io/RJMCMCNucleosomes/reference/postTreatment.md)
  for merging closely positioned nucleosomes

- [`mergeRDSFiles`](https://adeschen.github.io/RJMCMCNucleosomes/reference/mergeRDSFiles.md)
  for merging nucleosome information from selected RDS files

- [`plotNucleosomes`](https://adeschen.github.io/RJMCMCNucleosomes/reference/plotNucleosomes.md)
  for generating a graph containing the nucleosome positions and the
  read coverage

## Examples

``` r

## Loading dataset
data(reads_demo_02)

## Nucleosome positioning
## Since there is only one chromosome present in reads_demo_02, the name
## of the chromosome does not need to be specified
rjmcmc(reads = reads_demo_02, nbrIterations = 150, lambda = 3, kMax = 30,
            minInterval = 144, maxInterval = 290, minReads = 6)
#> RJMCMCNucleosomes - Predicted nucleosomes
#> 
#> Call:
#> rjmcmc(reads = reads_demo_02, nbrIterations = 150, kMax = 30, 
#>     lambda = 3, minInterval = 144, maxInterval = 290, minReads = 6)
#> 
#> Number of nucleosomes:
#> [1] 5
#> 
#> Nucleosomes positions:
#> GRanges object with 5 ranges and 0 metadata columns:
#>            seqnames    ranges strand
#>               <Rle> <IRanges>  <Rle>
#>   [1] chr_SYNTHETIC     10089      *
#>   [2] chr_SYNTHETIC     10246      *
#>   [3] chr_SYNTHETIC     10280      *
#>   [4] chr_SYNTHETIC     10663      *
#>   [5] chr_SYNTHETIC     10729      *
#>   -------
#>   seqinfo: 1 sequence from an unspecified genome; no seqlengths
```
