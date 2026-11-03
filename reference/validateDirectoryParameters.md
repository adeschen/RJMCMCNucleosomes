# Parameters validation for the [`mergeAllRDSFilesFromDirectory`](https://adeschen.github.io/RJMCMCNucleosomes/reference/mergeAllRDSFilesFromDirectory.md) function

Validation of all parameters needed by the public
[`mergeAllRDSFilesFromDirectory`](https://adeschen.github.io/RJMCMCNucleosomes/reference/mergeAllRDSFilesFromDirectory.md)
function.

## Usage

``` r
validateDirectoryParameters(directory)
```

## Arguments

- directory:

  a `character`, the name of the directory (relative or absolute path)
  containing RDS files.

## Value

`0` indicating that all parameters validations have been successful.

## Author

Astrid Deschênes

## Examples

``` r

## Load an existing directory
directory <- system.file("extdata", package = "RJMCMCNucleosomes")

## Testing using a real directory
RJMCMCNucleosomes:::validateDirectoryParameters(directory)
#> [1] 0
```
