# Run [`rjmcmc`](https://adeschen.github.io/RJMCMCNucleosomes/reference/rjmcmc.md) on multiple segments and merge results.

Run
[`rjmcmc`](https://adeschen.github.io/RJMCMCNucleosomes/reference/rjmcmc.md)
on a segment that is contained in a `list` of segments. Files generated
by the function are all saved in a directory specified by user. A RData
log file is created when a segment has been run while the result is
saved in a RDS file.

If the same output directory is used more than once, the
[`rjmcmc`](https://adeschen.github.io/RJMCMCNucleosomes/reference/rjmcmc.md)
won't be called for segments that have the corresponding RData log file.

## Usage

``` r
runCHR(
  p,
  seg,
  niter,
  kmax,
  lambda,
  ecartmin,
  ecartmax,
  minReads,
  adaptNbrIterations,
  vSeed = -1,
  saveAsRDS = FALSE,
  dirOut = "out"
)
```

## Arguments

- p:

  a `integer`, the position of the segment to treat in a `list` of
  `GRanges`.

- seg:

  a `list` of `GRanges` containing the segments to be process.

- niter:

  a positive `integer` or `numeric`, the number of iterations.
  Non-integer values of `nbrIterations` will be cast to `integer` and
  truncated towards zero.

- kmax:

  a positive `integer` or `numeric`, the maximum number of degrees of
  freedom per region. Non-integer values of `kmax` will be cast to
  `integer` and truncated towards zero.

- lambda:

  a positive `numeric`, the theoretical mean of the Poisson
  distribution. Default: 3.

- ecartmin:

  a `numeric`, the minimum distance between two nucleosomes.

- ecartmax:

  a `numeric`, the maximum distance between two nucleosomes.

- minReads:

  a positive `integer` or `numeric`, the minimum number of reads in a
  potential candidate region. Non-integer values of `minReads` will be
  cast to `integer` and truncated towards zero. Default: 5.

- adaptNbrIterations:

  a `logical` indicating if the number of iterations must be modified in
  function of the number of reads.

- vSeed:

  a `integer`. A seed used when reproducible results are needed. When a
  value inferior or equal to zero is given, a random integer is used.
  Default: -1.

- saveAsRDS:

  a `logical`. When `TRUE`, a RDS file containing the complete output of
  the c++ rjmcmc() function is created. Default: `FALSE`.

- dirOut:

  a `character` string representing the name of the directory that will
  contain the resulting outputs. Default: `"out"`.

## Value

`0` when successful.

## Author

Pascal Belleau, Astrid Deschênes

## Examples

``` r

## Load synthetic dataset of reads
data(syntheticNucleosomeReads)

## Use dataset of reads to create GRanges object
sampleGRanges <- GRanges(seqnames = syntheticNucleosomeReads$dataIP$chr,
    ranges = IRanges(start = syntheticNucleosomeReads$dataIP$start,
    end = syntheticNucleosomeReads$dataIP$end),
    strand = syntheticNucleosomeReads$dataIP$strand)

# Segmentation of the reads
seg <- segmentation(sampleGRanges, zeta=147, delta=50, maxLength=1000)
if (FALSE) { # \dontrun{
    dir.create("out")
    dir.create("out/done")
    dir.create("out/results")

    runCHR(p=1, seg=seg, niter=1000, kmax=330, lambda=3,
        ecartmin=147, ecartmax=297, minReads=5)
} # }
```
