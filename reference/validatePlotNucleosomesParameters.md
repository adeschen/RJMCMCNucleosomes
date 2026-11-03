# Parameters validation for the [`plotNucleosomes`](https://adeschen.github.io/RJMCMCNucleosomes/reference/plotNucleosomes.md) function

Validation of all parameters needed by the public
[`plotNucleosomes`](https://adeschen.github.io/RJMCMCNucleosomes/reference/plotNucleosomes.md)
function.

## Usage

``` r
validatePlotNucleosomesParameters(
  nucleosomePositions,
  reads,
  seqName,
  xlab,
  ylab,
  names
)
```

## Arguments

- nucleosomePositions:

  a `GRanges` or a `GRangesList` containing the nucleosome positions for
  one or multiple predictions obtained using the same reads. In presence
  of only one prediction (with multiple nucleosome positions), a
  `GRanges` is used. In presence of more than one predictions (as
  example, before and after post-treatment or results from different
  software), a `GRangesList` with one entry per prediction is used.

- reads:

  a `GRanges` containing forward and reverse reads. The `GRanges` should
  contain at least one read.

- seqName:

  a `character` string containing the label of the chromosome, present
  in the `GRanges` object, that will be used. The `NULL` value is
  accepted when only one seqname is present in the `GRanges`; the only
  seqname present will be used.

- xlab:

  a `character` string containing the label of the x-axis.

- ylab:

  a `character` string containing the label of the y-axis.

- names:

  a `vector` of a `character` string containing the label of each
  prediction set. The `vector` must be the same length as the
  `nucleosomePositions` `list` or 1 in presence of a `vector`.

## Value

`0` indicating that all parameters validations have been successful.

## Author

Astrid Deschênes, Pascal Belleau

## Examples

``` r

## Load GRanges dataset
data(reads_demo_01)

## Load RJMCMC result
data(RJMCMC_result)

## The function returns 0 when all parameters are valid
RJMCMCNucleosomes:::validatePlotNucleosomesParameters(nucleosomePositions =
RJMCMC_result$mu, reads = reads_demo_01, seqName = "chr_SYNTHETIC",
xlab = "position", ylab = "coverage", names = c("test"))
#> [1] 0

## The function raises an error when at least one parameter is not valid
#\dontrun{RJMCMCNucleosomes:::validatePlotNucleosomesParameters(
#nucleosomePositions = c("hi"), reads = reads,
#xlab = "position", ylab = "coverage", names = c("test"))}

#\dontrun{RJMCMCNucleosomes:::validatePlotNucleosomesParameters(
#nucleosomePositions = RJMCMC_result$mu, reads = reads_demo_01,
#seqName = "chr_SYNTHETIC", xlab = "position", ylab = "coverage",
#names = c("test_one", "test_false"))}
```
