# Forward reads and reverse reads in `GRanges` format (for demo purpose).

A group of forward and reverse reads, in a `GRanges`, that can be used
to test the `rjmcmc` function.

## Usage

``` r
data(reads_demo_01)
```

## Format

A `GRanges` containing forward and reverse reads.

## Value

A `GRanges` containing forward and reverse reads.

## See also

- [`rjmcmc`](https://adeschen.github.io/RJMCMCNucleosomes/reference/rjmcmc.md)
  for profiling of nucleosome positions

## Examples

``` r

## Loading dataset
data(reads_demo_01)

## Nucleosome positioning
rjmcmc(reads = reads_demo_01, nbrIterations = 100, lambda = 3, kMax = 30,
            minInterval = 146, maxInterval = 292, minReads = 5)
#> RJMCMCNucleosomes - Predicted nucleosomes
#> 
#> Call:
#> rjmcmc(reads = reads_demo_01, nbrIterations = 100, kMax = 30, 
#>     lambda = 3, minInterval = 146, maxInterval = 292, minReads = 5)
#> 
#> Number of nucleosomes:
#> [1] 1
#> 
#> Nucleosomes positions:
#> GRanges object with 1 range and 0 metadata columns:
#>            seqnames    ranges strand
#>               <Rle> <IRanges>  <Rle>
#>   [1] chr_SYNTHETIC     10068      *
#>   -------
#>   seqinfo: 1 sequence from an unspecified genome; no seqlengths
```
