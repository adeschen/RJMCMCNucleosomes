# RJMCMCNucleosomes: Bayesian hierarchical model for genome-wide nucleosome positioning with high-throughput short-read data (MNase-Seq)

This package detects nucleosome positions genome-wide from paired-end or
single-end MNase-Seq reads using a Bayesian hierarchical model. Read
positions are modelled as a mixture of Student's t-distributions with an
informative Multinomial-Dirichlet prior on nucleosome locations, and the
number of nucleosomes is estimated with a reversible jump Markov chain
Monte Carlo (RJMCMC) algorithm. Functions are provided to split
chromosomes into segments for parallel analysis, merge and post-process
the predictions, and plot nucleosome positions alongside read coverage.

## See also

- [`rjmcmc`](https://adeschen.github.io/RJMCMCNucleosomes/reference/rjmcmc.md)
  for profiling of nucleosome positions for a segment

- [`rjmcmcCHR`](https://adeschen.github.io/RJMCMCNucleosomes/reference/rjmcmcCHR.md)
  for profiling of nucleosome positions for a large region. The function
  will take care of splitting and merging

- [`segmentation`](https://adeschen.github.io/RJMCMCNucleosomes/reference/segmentation.md)
  for splitting a `GRanges` containing reads in a list of smaller
  segments for the `rjmcmc` function

- [`postTreatment`](https://adeschen.github.io/RJMCMCNucleosomes/reference/postTreatment.md)
  for merging closely positioned nucleosomes

- [`mergeRDSFiles`](https://adeschen.github.io/RJMCMCNucleosomes/reference/mergeRDSFiles.md)
  for merging nucleosome information from selected RDS files

- [`plotNucleosomes`](https://adeschen.github.io/RJMCMCNucleosomes/reference/plotNucleosomes.md)
  for generating a graph containing the nucleosome positions and the
  read coverage

## Author

Pascal Belleau, Rawane Samb, Astrid Deschênes, Khader Khadraoui, Lajmi
Lakhal and Arnaud Droit

Maintainer: Astrid Deschênes \<adeschen@hotmail.com\>
