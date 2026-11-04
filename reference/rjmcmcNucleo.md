# Interface for the RJMCMC nucleosome mapping method in C++

Function that calls the core of the nucleosome positioning mapping
function that is implemented in C++.

## Arguments

- startPosForwardReads:

  a `vector` of `numeric`, the start position of all the forward reads.

- startPosReverseReads:

  a `vector` of `numeric`, the start position of all the reverse reads.
  Beware that the start position of a reverse read is always higher than
  the end position.

- nbrIterations:

  a positive `integer` or `numeric`, the number of iterations.
  Non-integer values of `nbrIterations` will be cast to `integer` and
  truncated towards zero.

- kMax:

  a positive `integer` or `numeric`, the maximum number of nucleosomes
  per region. Non-integer values of `kMax` will be cast to `integer` and
  truncated towards zero.

- lambda:

  a positive `numeric`, the theoretical mean of the Poisson
  distribution. Default: 3.

- minInterval:

  a `numeric`, the minimum distance between two nucleosomes.

- maxInterval:

  a `numeric`, the maximum distance between two nucleosomes.

- minReads:

  a positive `integer` or `numeric`, the minimum number of reads in a
  potential candidate region. Non-integer values of `minReads` will be
  cast to `integer` and truncated towards zero. Default: 5.

- adaptIterationsToReads:

  a `logical` indicating if the number of iterations must be modified in
  function of the number of reads. Default: `TRUE`.

- vSeed:

  a `integer`. A seed used when reproducible results are needed. When a
  value inferior or equal to zero is given, a random integer is used.
  Default: -1.

## Value

a `list` containing:

- k a `integer`, the number of nucleosomes.

- k_max a `integer`, the maximum number of nucleosomes obtained during
  the iteration process.

- it a `vector` of `integer` of length `k`, the variance of the forward
  reads for each nucleosome.

- nbState a `integer`, the number of changes of state.

- mu a `matrix` of `numeric` with `k_max` columns and `nbState` row
  containing, in each row, the `mu` values associated with the state
  identified by the row number.

- muHat a `matrix` of `numeric` with `k_max` columns and `k_max` rows
  containing, in each row, the mean `mu` values associated with the
  number of nucleosomes detected. The row number corresponds to the
  number of nucleosomes detected.

- nbK a `vector` of length `k_max` containing `integer`, the number of
  iterations which detected a specific number of nucleosomes. The
  position in the vector correspond to the number of nucleosomes.

## Author

Pascal Belleau, Astrid Deschênes

## Examples

``` r

data(reads_demo_01)

forward <- start(reads_demo_01[strand(reads_demo_01) == "+"])
reverse <- end(reads_demo_01[strand(reads_demo_01) == "-"])

## Run nucleosome positioning
result <- RJMCMCNucleosomes:::rjmcmcNucleo(
            startPosForwardReads = forward,
            startPosReverseReads = reverse,
            nbrIterations = 1000, lambda = 2, kMax = 30,
            minInterval = 146, maxInterval = 292, minReads = 5,
            adaptIterationsToReads = TRUE, vSeed = -1)

## Print the final estimation of the number of nucleosomes
result$k
#> [1] 1 1 2 1 1 2 3 3

## Print the position of nucleosomes
result$mu
#>          [,1]     [,2]     [,3]
#> [1,] 10123.96     0.00     0.00
#> [2,] 10475.57     0.00     0.00
#> [3,] 10102.32 10475.57     0.00
#> [4,] 10102.32     0.00     0.00
#> [5,] 10217.73     0.00     0.00
#> [6,] 10076.43 10217.73     0.00
#> [7,] 10076.43 10133.67 10217.73
#> [8,] 10076.43 10082.72 10217.73
```
