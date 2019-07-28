# DMF.jl

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.2656681.svg)](https://doi.org/10.5281/zenodo.2656681)

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/aprasadan/DMF.jl/593f3924919e8f297b8662a87291cf6527ab5b87)


DMF.jl is a [julia](https://julialang.org/) package providing the Dynamic Mode Factorization algorithm, which is an extension of the Dynamic Mode Decomposition algorithm. This algorithm can be used to perform Blind Source Separation. Details about this algorithm are forthcoming. 

## Installation

The package has not been registered in `METADATA.jl` and can be installed with:
```julia
(v1.0) pkg> add https://github.com/aprasadan/DMF.jl
```

## Example

A typical example of the usage of DMF.jl is:
```
using DMF
using LinearAlgebra

p = 100
k = 2
n = 1000

Q = randn(p, k)
S = [gen_cos_sequence(n, 2.0, 1.0)[1] gen_arma_sequence(n, [0.2, 0.7], [], 1.0)] 
Q = mapslices(normalize, Q; dims = 1) # Eigenvectors
S = mapslices(normalize, S; dims = 1) # Latent Signals, one cosine and one AR(2)
X = Q * S' # Data matrix (mixed)

# Perform unmixing
w, Q_hat, C_hat, A_hat = dmf(X; C_nsv = k, lag = 1)

@show eigenvector_error(Q, Q_hat[:, 1:k]) # Should be small
@show eigenvector_error(S, C_hat) # Should be small
@show [cos(2.0), 0.6], w[1:k] # Should be close
```

## Requirements

This package requires Julia 1.0. Additionally, it requires the LinearAlgebra, DSP, Statistics, and StatsBase packages. The Combinatorics package is used in the error computation function and QuantEcon is needed to simulate ARMA processes. Neither Combinatorics nor QuantEcon are fundamentally required to use the DMF functionality. 

## License

This package is provided as is under the Apache 2.0 License. 

## Author

Arvind Prasadan

prasadan@umich.edu

University of Michigan, Department of EECS

