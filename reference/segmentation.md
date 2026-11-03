# Split a `GRanges` containing reads in a list of smaller segments for the `rjmcmc` function.

Split a `GRanges` of reads (as example, the reads from a chromosome) in
a `list` of smaller `GRanges` so that the `rjmcmc` function can be run
on each segment.

## Usage

``` r
segmentation(reads, zeta = 147, delta, maxLength)
```

## Arguments

- reads:

  a `GRanges`, the reads that need to be segmented.

- zeta:

  a positive `integer` or `numeric`, the length of the nucleosomes.
  Default: 147.

- delta:

  a positive `integer` or `numeric`, the accepted range of overlapping
  section between segments. The overlapping section being `zeta` +
  `delta`.

- maxLength:

  a positive `integer` or `numeric`, the length of each segment.

## Value

a `GRangesList` containing all the segments.

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
segmentation(reads = sampleGRanges, zeta = 147, delta = 50,
maxLength = 1000)
#> GRangesList object of length 69:
#> $`1`
#> GRanges object with 460 ranges and 0 metadata columns:
#>              seqnames    ranges strand
#>                 <Rle> <IRanges>  <Rle>
#>     [1] chr_SYNTHETIC  991-1031      +
#>     [2] chr_SYNTHETIC  991-1031      +
#>     [3] chr_SYNTHETIC  993-1033      +
#>     [4] chr_SYNTHETIC  993-1033      +
#>     [5] chr_SYNTHETIC  995-1035      +
#>     ...           ...       ...    ...
#>   [456] chr_SYNTHETIC 1943-1983      -
#>   [457] chr_SYNTHETIC 1943-1983      -
#>   [458] chr_SYNTHETIC 1945-1985      -
#>   [459] chr_SYNTHETIC 1946-1986      -
#>   [460] chr_SYNTHETIC 1947-1987      -
#>   -------
#>   seqinfo: 1 sequence from an unspecified genome; no seqlengths
#> 
#> ...
#> <68 more elements>
```
