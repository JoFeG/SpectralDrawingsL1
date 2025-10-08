using LinearAlgebra, Graphs, Plots, DelimitedFiles
include("../src/spectral_drawing_utils.jl")

A = readdlm("./data/graph_442.mat", Int64)
n = size(A)[1]
G = SimpleGraph(A)
L = laplacian_matrix(G)

LEIG = eigen(Matrix(L))
X = LEIG.vectors[:,2:3]

fig = plot()
GraphVectsPlot(G, X)
savefig(fig, "./out/L2SD_graph_442.png")

bG, X = b_VectorsBruteForce(G)

anim = @animate for i=1:36
    plot(camera = (10i,30))
    GraphVectsPlot(G, X[:,1:3])
end

gif(anim, "./out/L1SD_graph_442.gif", fps = 8)