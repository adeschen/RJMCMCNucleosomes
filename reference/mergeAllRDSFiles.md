# Merge nucleosome information

Merge nucleosome information present in multiple RDS files.

## Usage

``` r
mergeAllRDSFiles(arrayOfFiles)
```

## Arguments

- arrayOfFiles:

  a `vector`, the name of each file that must be used to merge
  nucleosome information.

## Value

a `list` of `class` "rjmcmcNucleosomesMerge" containing:

- k a `integer`, the number of nucleosomes.

- `mu` a `GRanges` containing the positions of the nucleosomes.

## Author

Pascal Belleau, Astrid Deschênes

## Examples

``` r

## Loading two files containing nucleosomes information for two sections of
## the same chromosome
file_1 <- dir(system.file("extdata", package = "RJMCMCNucleosomes"),
                pattern = "RJMCMC_seg_01.RDS",
                full.names = TRUE)

file_2 <- dir(system.file("extdata", package = "RJMCMCNucleosomes"),
                pattern = "RJMCMC_seg_02.RDS",
                full.names = TRUE)

## Merging nucleosomes information from the two files
result <- RJMCMCNucleosomes:::mergeAllRDSFiles(c(file_1, file_2))
```
