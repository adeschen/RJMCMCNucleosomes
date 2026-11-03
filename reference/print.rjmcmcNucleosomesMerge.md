# Formatted output of predicted nucleosomes

Generates a formatted output of a list marked as an
`rjmcmcNucleosomesMerge` class

## Usage

``` r
# S3 method for class 'rjmcmcNucleosomesMerge'
print(x, ...)
```

## Arguments

- x:

  the output object from `mergeAllRDSFilesFromDirectory` function to be
  printed

- ...:

  arguments passed to or from other methods

## Value

an object of class `mergeAllRDSFilesFromDirectory`

## Author

Astrid Deschênes

## Examples

``` r

## Use a directory present in the RJMCMC package
directoryWithRDSFiles <- system.file("extdata",
package = "RJMCMCNucleosomes")

## Merge nucleosomes info from RDS files present in directory
## It is assumed that all files present in the directory are nucleosomes
## result for the same chromosome
result <- mergeAllRDSFilesFromDirectory(directoryWithRDSFiles)

## Show resulting nucleosomes
print(result)
#> 
#> RJMCMCNucleosomes - Predicted nucleosomes
#> 
#> Number of nucleosomes:
#> [1] 11
#> 
#> Nucleosomes positions:
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

## or simply
result
#> 
#> RJMCMCNucleosomes - Predicted nucleosomes
#> 
#> Number of nucleosomes:
#> [1] 11
#> 
#> Nucleosomes positions:
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
```
