# Nucleosomes detected by running RJMCMC function using reads from reads_demo_02 dataset (for demo purpose).

A `list` of `class` "rjmcmcNucleosomes" which contains the information
about the detected nucleosomes.

## Usage

``` r
data(RJMCMC_result)
```

## Format

A `list` of `class` "rjmcmcNucleosomes" containing:

- `call` the matched call.

- `k` a `integer`, the final estimation of the number of nucleosomes.
  `0` when no nucleosome is detected.

- `mu` a `vector` of `numeric` of length `k`, the positions of the
  nucleosomes. `NA` when no nucleosome is detected.

- `k_max` a `integer`, the maximum number of nucleosomes obtained during
  the iteration process. `NA` when no nucleosome is detected.

## Value

A `list` of `class` "rjmcmcNucleosomes" containing:

- `call` the matched call.

- `k` a `integer`, the final estimation of the number of nucleosomes.
  `0` when no nucleosome is detected.

- `mu` a `vector` of `numeric` of length `k`, the positions of the
  nucleosomes. `NA` when no nucleosome is detected.

- `k_max` a `integer`, the maximum number of nucleosomes obtained during
  the iteration process. `NA` when no nucleosome is detected.

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
data(RJMCMC_result)
data(reads_demo_02)

## Results before post-treatment
RJMCMC_result$mu
#> GRanges object with 6 ranges and 0 metadata columns:
#>            seqnames    ranges strand
#>               <Rle> <IRanges>  <Rle>
#>   [1] chr_SYNTHETIC     10072      *
#>   [2] chr_SYNTHETIC     10241      *
#>   [3] chr_SYNTHETIC     10574      *
#>   [4] chr_SYNTHETIC     10656      *
#>   [5] chr_SYNTHETIC     10669      *
#>   [6] chr_SYNTHETIC     10744      *
#>   -------
#>   seqinfo: 1 sequence from an unspecified genome; no seqlengths

## Post-treatment function which merged closely positioned nucleosomes
postResult <- postTreatment(reads = reads_demo_02,
    extendingSize = 60, chrLength = 100000, resultRJMCMC = RJMCMC_result)

## Results after post-treatment
postResult
#> GRanges object with 4 ranges and 0 metadata columns:
#>            seqnames    ranges strand
#>               <Rle> <IRanges>  <Rle>
#>   [1] chr_SYNTHETIC     10072      *
#>   [2] chr_SYNTHETIC     10241      *
#>   [3] chr_SYNTHETIC     10665      *
#>   [4] chr_SYNTHETIC     10744      *
#>   -------
#>   seqinfo: 1 sequence from an unspecified genome; no seqlengths
```
