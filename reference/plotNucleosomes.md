# Generate a graph of nucleosome positions with read coverage

Generate a graph for a `GRanges` or a `GRangesList` of nucleosome
positions. In presence of only one prediction (with multiple nucleosome
positions), a `GRanges` is used. In presence of more than one
predictions (as example, before and after post-treatment or results from
different software), a `GRangesList` with one entry per prediction is
used. All predictions must have been obtained using the same reads.

## Usage

``` r
plotNucleosomes(
  nucleosomePositions,
  reads,
  seqName = NULL,
  xlab = "position",
  ylab = "coverage",
  names = NULL
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
  seqname present will be used. Default: `NULL`.

- xlab:

  a `character` string containing the label of the x-axis.

- ylab:

  a `character` string containing the label of the y-axis.

- names:

  a `vector` of a `character` string containing the label of each
  prediction set. The `vector` must be the same length as the
  `nucleosomePositions` `list` or 1 in presence of a `vector`. When
  `NULL`, the name of the elements of the `list` are used or the string
  "Nucleosome" for a `vector` are used. Default: `NULL`.

## Value

a graph containing the nucleosome positions and the read coverage

## Author

Astrid Deschênes

## Examples

``` r

## Load reads dataset
data(reads_demo_01)

## Run RJMCMC method
result <- rjmcmc(reads = reads_demo_01,
            seqName = "chr_SYNTHETIC",
            nbrIterations = 4000, lambda = 2, kMax = 30,
            minInterval = 146, maxInterval = 292, minReads = 5,
            vSeed = 10213)

## Create graph using the synthetic map
plotNucleosomes(nucleosomePositions = result$mu, seqName = "chr_SYNTHETIC",
            reads = reads_demo_01)

```
