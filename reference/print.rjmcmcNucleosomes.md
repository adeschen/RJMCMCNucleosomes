# Formatted output of predicted nucleosomes

Generates a formatted output of a list marked as an `rjmcmcNucleosomes`
class

## Usage

``` r
# S3 method for class 'rjmcmcNucleosomes'
print(x, ...)
```

## Arguments

- x:

  the output object from `rjmcmc` function to be printed

- ...:

  arguments passed to or from other methods

## Value

An object of class `rjmcmcNucleosomes`

## Author

Astrid Deschênes

## Examples

``` r

## Loading dataset
data(RJMCMC_result)

print(RJMCMC_result)
#> RJMCMCNucleosomes - Predicted nucleosomes
#> 
#> Call:
#> rjmcmc(reads = reads_demo_02, seqName = "chr_SYNTHETIC", nbrIterations = 1e+05, 
#>     kMax = 30, lambda = 2, minInterval = 146, maxInterval = 490, 
#>     minReads = 3, vSeed = 32)
#> 
#> Number of nucleosomes:
#> [1] 6
#> 
#> Nucleosomes positions:
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
```
