## Usage example:

```
julia> include("./src/spectral_drawing_utils.jl");

julia> A = readdlm("./data/graph_442.mat", Int64);

julia> bG, X = L1VectorsBruteForce(G);

julia> bG
1.6666666666666665

julia> X
5×8 Matrix{Float64}:
 -0.25      -0.25       0.166667   0.166667  -0.166667  -0.166667   0.25       0.25
 -0.25       0.166667  -0.25       0.166667  -0.166667   0.25      -0.166667   0.25
  0.166667  -0.25       0.166667  -0.25       0.25      -0.166667   0.25      -0.166667
  0.166667   0.166667  -0.25      -0.25       0.25       0.25      -0.166667  -0.166667
  0.166667   0.166667   0.166667   0.166667  -0.166667  -0.166667  -0.166667  -0.166667

julia> rank(X)
3

julia> fig = plot(); GraphVectsPlot(G,X[:,1:3]);

julia> savefig(fig,"./out/L1SD_graph_442.png")
```

![L1SD_graph_442](./out/L1SD_graph_442.png)
