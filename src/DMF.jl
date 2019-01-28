# Arvind Prasadan
# 2019 January
# DMF Package
# Main Module File

"""
Module providing the Dynamic Mode Factorication (cf. Dynamic Mode Decomposition) algorithm.
"""
module DMF

# Packages
# Math
using LinearAlgebra
# Signal Processing
using DSP
# Statistics
using Statistics
using QuantEcon
using StatsBase
# SOBI Via R
using RCall

# Functions to export (all)
export 	dmf, # Main Algorithm
	optshrink, # Denoising
	SOBI_Wrapper, # Wrapper for SOBI method
	eigenvector_error, # Loss function
	autocorrelation, # Autocorrelation function
	autocorr_mat, # Autocorrelation matrix
	gen_arma_sequence, # Generate a realization of an ARMA process
	gen_cos_sequence # Generate a cosine sequence

# Code files
include("dmf_function.jl")
include("optshrink.jl")
include("SOBI_Wrapper.jl")
include("eigenvector_error.jl")
include("autocorrelation.jl")
include("autocorr_mat.jl")
include("gen_arma_sequence.jl")
include("gen_cos_sequence.jl")
end
