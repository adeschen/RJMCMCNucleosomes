# An internal post treatment function to merge closely positioned nucleosomes, from the same chromosome, identified by the [`rjmcmc`](https://adeschen.github.io/RJMCMCNucleosomes/reference/rjmcmc.md) function

An internal helper function which merges closely positioned nucleosomes
to rectify the over splitting and provide a more conservative approach.
Beware that each chromosome must be treated separately.

The function uses the Bioconductor `package` `consensusSeeker` to group
closely positioned nucleosomes.

## Usage

``` r
postMerge(
  reads,
  resultRJMCMC,
  extendingSize,
  chrLength,
  minReads = 5,
  seqName = NULL
)
```

## Arguments

- reads:

  a `GRanges` containing all forward and reverse reads. The start
  positions of both reads are going to be used for the analysis. Beware
  that the start position of a reverse read is always higher than the
  end position.

- resultRJMCMC:

  an object of class 'rjmcmcNucleosomes' or 'rjmcmcNucleosomesMerge'
  containing information about nucleosomes.

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

- minReads:

  a positive `integer` or `numeric`, the minimum number of reads in a
  potential candidate region. Non-integer values of `minReads` will be
  cast to `integer` and truncated towards zero. Default: 5.

## Value

a `GRanges` with the updated values of the nucleosome positions. When no
nucleosome is present, `NULL` is returned.

## Author

Pascal Belleau, Astrid Deschênes

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
postResult <- RJMCMCNucleosomes:::postMerge(reads = reads_demo_02,
resultRJMCMC = RJMCMC_result, extendingSize = 80, chrLength = 73500)

## Results after post-treatment
postResult
#> GRanges object with 3 ranges and 0 metadata columns:
#>            seqnames    ranges strand
#>               <Rle> <IRanges>  <Rle>
#>   [1] chr_SYNTHETIC     10072      *
#>   [2] chr_SYNTHETIC     10241      *
#>   [3] chr_SYNTHETIC     10693      *
#>   -------
#>   seqinfo: 1 sequence from an unspecified genome; no seqlengths
```
