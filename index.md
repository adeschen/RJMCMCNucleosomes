# Genome-Wide Nucleosome Positioning using High-Throughput Short-Read Data (MNase-Seq)

[![R-CMD-check-bioc](https://github.com/adeschen/RJMCMCNucleosomes/actions/workflows/check-bioc.yaml/badge.svg)](https://github.com/adeschen/RJMCMCNucleosomes/actions/workflows/check-bioc.yaml)
[![codecov](https://codecov.io/gh/adeschen/RJMCMCNucleosomes/branch/devel/graph/badge.svg)](https://app.codecov.io/gh/adeschen/RJMCMCNucleosomes/tree/devel)

This package uses informative Multinomial-Dirichlet prior in a t-mixture
with reversible jump estimation of nucleosome positions for genome-wide
profiling.

This package is in R with an optimized section in C++.

## Citing

If you use this package for a publication, we would ask you to cite the
following:

> Samb R, Khadraoui K, Belleau P, et al. (2015). “Using informative
> Multinomial-Dirichlet prior in a t-mixture with reversible jump
> estimation of nucleosome positions for genome-wide profiling.”
> Statistical Applications in Genetics and Molecular Biology. Volume 14,
> Issue 6, Pages 517-532, ISSN (Online) 1544-6115, ISSN (Print)
> 2194-6302, December 2015, [doi:
> 10.1515/sagmb-2014-0098](http://dx.doi.org/10.1515/sagmb-2014-0098)

## Research Resource Identifier (RRID)

The RRID for the **RJMCMCNucleosomes** package is **RRID:SCR_029241**.

## Bioconductor Package

[![Bioconductor
Time](http://bioconductor.org/shields/years-in-bioc/RJMCMCNucleosomes.svg)](http://bioconductor.org/packages/release/bioc/html/RJMCMCNucleosomes "Bioconductor status")

*RJMCMCNucleosomes* is now an official package of
[Bioconductor](http://bioconductor.org/). The current release can be
directly downloaded from their website: [Current
release](http://bioconductor.org/packages/RJMCMCNucleosomes/)

## Notes

To use this current *RJMCMCNucleosomes* version, the use of the Rcpp
package is mandatory. This implies having GSL library installed.

## Authors

[Pascal
Belleau](http://ca.linkedin.com/in/pascalbelleau "Pascal Belleau"),
[Rawane Samb](https://ca.linkedin.com/in/rawanesamb "Rawane Samb"),
[Astrid
Deschênes](http://ca.linkedin.com/in/astriddeschenes "Astrid Deschênes"),
[Khader
Khadraoui](http://archimede.mat.ulaval.ca/pages/khaderk/ "Khader Khadraoui"),
[Lajmi
Lakhal-Chaieb](https://www.researchgate.net/profile/Lajmi_Lakhal-Chaieb "Lajmi Lakhal-Chaieb")
and [Arnaud Droit](http://ca.linkedin.com/in/drarnaud "Arnaud Droit").

## Maintainer

[Astrid
Deschênes](http://ca.linkedin.com/in/astriddeschenes "Astrid Deschênes")

## License

This package and the underlying *RJMCMCNucleosomes* code are distributed
under the Artistic license 2.0. You are free to use and redistribute
this software.

For more information on Artistic 2.0 License see
<http://opensource.org/licenses/Artistic-2.0>

## Bugs/Feature requests

If you have any bugs or feature requests, [let us
know](https://github.com/adeschen/RJMCMCNucleosomes/issues).

Thanks!

## Logo

The RJMCMCNucleosomes logo is licensed under the [Creative Commons
Attribution 4.0 International License (CC BY
4.0)](https://creativecommons.org/licenses/by/4.0/). Its source files
are available in the
[RJMCMCNucleosomes_logo](https://github.com/adeschen/RJMCMCNucleosomes_logo)
repository.
