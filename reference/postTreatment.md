# A post-treatment function to merge closely positioned nucleosomes, from the same chromosome, identified by the [`rjmcmc`](https://adeschen.github.io/RJMCMCNucleosomes/reference/rjmcmc.md) function.

A helper function which merges closely positioned nucleosomes to rectify
the over splitting and provide a more conservative approach. Beware that
each chromosome must be treated separately.

## Usage

``` r
postTreatment(
  reads,
  seqName = NULL,
  resultRJMCMC,
  extendingSize = 74L,
  chrLength
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

- resultRJMCMC:

  an object of `class` "rjmcmcNucleosomes" or "rjmcmcNucleosomesMerge",
  the information about nucleosome positioning for an entire chromosome
  or a region that must be treated as one unit.

- extendingSize:

  a positive `numeric` or a positive `integer` indicating the size of
  the consensus region used to group closely positioned nucleosomes. The
  minimum size of the consensus region is equal to twice the value of
  the `extendingSize` parameter. The numeric will be treated as an
  integer. Default: 74.

- chrLength:

  a positive `numeric` or a positive `integer` indicating the length of
  the current chromosome. The length of the chromosome is used to ensure
  that the consensus positions are all located inside the chromosome.

## Value

a `GRanges`, the updated nucleosome positions. When no nucleosome is
present, `NULL` is returned.

## Author

Pascal Belleau, Astrid Deschênes

## Examples

``` r

## Loading dataset
data(reads_demo_02)

## Nucleosome positioning, running both merge and split functions
result <- rjmcmc(reads = reads_demo_02,
            seqName = "chr_SYNTHETIC", nbrIterations = 1000,
            lambda = 2, kMax = 30, minInterval = 146,
            maxInterval = 490, minReads = 3, vSeed = 11)

## Before post-treatment
result
#> RJMCMCNucleosomes - Predicted nucleosomes
#> 
#> Call:
#> rjmcmc(reads = reads_demo_02, seqName = "chr_SYNTHETIC", nbrIterations = 1000, 
#>     kMax = 30, lambda = 2, minInterval = 146, maxInterval = 490, 
#>     minReads = 3, vSeed = 11)
#> 
#> Number of nucleosomes:
#> [1] 3
#> 
#> Nucleosomes positions:
#> GRanges object with 3 ranges and 0 metadata columns:
#>            seqnames    ranges strand
#>               <Rle> <IRanges>  <Rle>
#>   [1] chr_SYNTHETIC     10080      *
#>   [2] chr_SYNTHETIC     10247      *
#>   [3] chr_SYNTHETIC     10677      *
#>   -------
#>   seqinfo: 1 sequence from an unspecified genome; no seqlengths

##Post-treatment function which merged closely positioned nucleosomes
postResult <- postTreatment(reads = reads_demo_02,
                    seqName = "chr_SYNTHETIC", result, 100, 73500)

## After post-treatment
postResult
#> GRanges object with 2 ranges and 0 metadata columns:
#>            seqnames    ranges strand
#>               <Rle> <IRanges>  <Rle>
#>   [1] chr_SYNTHETIC     10173      *
#>   [2] chr_SYNTHETIC     10677      *
#>   -------
#>   seqinfo: 1 sequence from an unspecified genome; no seqlengths
```
