# Parameters validation for the [`mergeRDSFiles`](https://adeschen.github.io/RJMCMCNucleosomes/reference/mergeRDSFiles.md) function

Validation of all parameters needed by the public
[`mergeRDSFiles`](https://adeschen.github.io/RJMCMCNucleosomes/reference/mergeRDSFiles.md)
function.

## Usage

``` r
validateRDSFilesParameters(RDSFiles)
```

## Arguments

- RDSFiles:

  a `vector`, the names of all RDS used to merge nucleosome information.
  The files must contain R object of `class` "rjmcmcNucleosomes" or
  "rjmcmcNucleosomesMerge".

## Value

`0` indicating that all parameters validations have been successful.

## Author

Astrid Deschênes

## Examples

``` r

## Loading a file
file_test <- dir(system.file("extdata", package = "RJMCMCNucleosomes"),
pattern = "RJMCMC_seg_02.RDS", full.names = TRUE)

## Testing using a real file
RJMCMCNucleosomes:::validateRDSFilesParameters(file_test)
#> [1] 0
```
