## Usage example:

The adjacency matrix files (like `graph_442.mat`) can be downloaded from [The House of Graphs](https://houseofgraphs.org/).

**Be aware that the brute force algorithms are exponential, up to n ≈ 16 is reasonable.**

```
julia> include("./src/spectral_drawing_utils.jl");

julia> A = readdlm("./data/graph_442.mat", Int64);

julia> G = SimpleGraph(A);

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

julia> k = rank(X)
3

julia> fig = plot(); GraphVectsPlot(G,X[:,1:3]);

julia> savefig(fig,"./out/L1SD_graph_442.png")
```

![L1SD_graph_442](./out/L1SD_graph_442.png)


| id   | Name               | b(G)    | size(X) | rank(X) |
|------|--------------------|---------|---------|---------| 
| 74   | Tetrahedral Graph  | 2.0     | (4, 14) | 3       |
| 226  | Octahedral Graph   | 2.0     | (6, 8)  | 3       |
| 1022 | Cubical Graph      | 1.0     | (8, 6)  | 3       |
| 1043 | Dodecahedral Graph |         |         |         |
| 1186 | Icosahedral Graph  | 1.66667 | (12,12) | 6       |
| 264  | K_{2,3}            | 1.25    | (5,18)  | 4       |
| 84   | K_{3,3}            | 1.5     | (6,18)  | 4       |
| 442  | W_5                | 1.66667 | (5,8)   | 3       |
| 462  | K_5                | 2.5     | (5,30)  | 4       |
