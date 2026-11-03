# Formatted output of predicted nucleosomes

Generates a formatted output of a list marked as an
`rjmcmcNucleosomesBeforeAndAfterPostTreatment` class

## Usage

``` r
# S3 method for class 'rjmcmcNucleosomesBeforeAndAfterPostTreatment'
print(x, ...)
```

## Arguments

- x:

  the output object from `rjmcmcCHR` function to be printed

- ...:

  arguments passed to or from other methods

## Value

an object of class `rjmcmcNucleosomesBeforeAndAfterPostTreatment`

## Author

Astrid Deschênes

## Examples

``` r

## Load synthetic dataset of reads
data(syntheticNucleosomeReads)

## Use dataset of reads to create GRanges object
sampleGRanges <- GRanges(syntheticNucleosomeReads$dataIP)

## Run nucleosome detection on the entire sample
if (FALSE) result <- rjmcmcCHR(reads = sampleGRanges, zeta = 147, delta=50,
maxLength=1200, nbrIterations = 1000, lambda = 3, kMax = 30,
minInterval = 146, maxInterval = 292, minReads = 5, vSeed = 10113,
nbCores = 2, saveAsRDS = FALSE) # \dontrun{}

## Print result
if (FALSE) print(result) # \dontrun{}
```
