using LinearAlgebra, Graphs, Plots, DelimitedFiles
include("../src/spectral_drawing_utils.jl")

A = readdlm("./data/graph_442.mat", Int64)
n = size(A)[1]
G = SimpleGraph{Int64}(A)

AEIG = eigen(A)
#display(AEIG)

X = AEIG.vectors[:,2:4]
#GraphVectsPlot(G, X)

anim = @animate for i=1:36
    plot(camera = (10i,30))
    GraphVectsPlot(G, X)
end
gif(anim, "../out/graph_442.gif", fps = 8)