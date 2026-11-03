# Merge nucleosome information from selected RDS files.

Merge nucleosome information present in RDS files into one object of
`class` "rjmcmcNucleosomesMerge".

## Usage

``` r
mergeRDSFiles(RDSFiles)
```

## Arguments

- RDSFiles:

  a `vector`, the names of all RDS used to merge nucleosome information.
  The files must contain R object of `class` "rjmcmcNucleosomes" or
  "rjmcmcNucleosomesMerge".

## Value

a `list` of `class` "rjmcmcNucleosomesMerge" containing:

- k a `integer`, the number of nucleosomes.

- `mu` a `GRanges` containing the positions of the nucleosomes.

## Author

Pascal Belleau, Astrid Deschênes

## Examples

``` r

## Use RDS files present in the RJMCMC package
RDSFiles <- dir(system.file("extdata", package = "RJMCMCNucleosomes"),
full.names = TRUE, pattern = "*RDS")

## Merge nucleosomes info from RDS files present in directory
result <- mergeRDSFiles(RDSFiles)

## Print the number and the position of the nucleosomes
result$k
#> [1] 11
result$mu
#> GRanges object with 11 ranges and 0 metadata columns:
#>             seqnames    ranges strand
#>                <Rle> <IRanges>  <Rle>
#>    [1] chr_SYNTHETIC     10077      *
#>    [2] chr_SYNTHETIC     10236      *
#>    [3] chr_SYNTHETIC     10406      *
#>    [4] chr_SYNTHETIC     10571      *
#>    [5] chr_SYNTHETIC     10744      *
#>    [6] chr_SYNTHETIC     10842      *
#>    [7] chr_SYNTHETIC     10846      *
#>    [8] chr_SYNTHETIC     10896      *
#>    [9] chr_SYNTHETIC     10906      *
#>   [10] chr_SYNTHETIC     11410      *
#>   [11] chr_SYNTHETIC     11580      *
#>   -------
#>   seqinfo: 1 sequence from an unspecified genome; no seqlengths

## Class of the output object
class(result)
#> [1] "rjmcmcNucleosomesMerge"

```
