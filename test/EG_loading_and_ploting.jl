using LinearAlgebra, Graphs, Plots, DelimitedFiles
include("../src/spectral_drawing_utils.jl")

A = readdlm("./data/graph_442.mat", Int64)
n = size(A)[1]
G = SimpleGraph{Int64}(A)

AEIG = eigen(A)
#display(AEIG)

X = AEIG.vectors[:,3:4]
GraphVectsPlot(G, X)