# Merge nucleosome information from all RDS files present in a same directory. Beware that only nucleosome information from same chromosome should be merged together.

Merge nucleosome information, from all RDS files present in a same
directory, into one object of `class` "rjmcmcNucleosomesMerge".

## Usage

``` r
mergeAllRDSFilesFromDirectory(directory)
```

## Arguments

- directory:

  a `character`, the name of the directory (relative or absolute path)
  containing RDS files. The RDS files must contain R object of `class`
  "rjmcmcNucleosomes" or "rjmcmcNucleosomesMerge".

## Value

a `list` of `class` "rjmcmcNucleosomesMerge" containing:

- k a `integer`, the number of nucleosomes.

- `mu` a `GRanges` containing the positions of the nucleosomes.

## Author

Pascal Belleau, Astrid Deschênes

## Examples

``` r

## Use a directory present in the RJMCMC package
directoryWithRDSFiles <- system.file("extdata",
package = "RJMCMCNucleosomes")

## Merge nucleosomes info from RDS files present in directory
## It is assumed that all files present in the directory are nucleosomes
## result for the same chromosome
result <- mergeAllRDSFilesFromDirectory(directoryWithRDSFiles)

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
