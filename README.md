## Usage example:

The adjacency matrix files (like `graph_442.mat`) can be downloaded from [The House of Graphs](https://houseofgraphs.org/).

**Be aware that the brute force algorithms are exponential, up to n ≈ 16 is reasonable.**

```
julia> include("./src/spectral_drawing_utils.jl");

julia> A = readdlm("./data/graph_442.mat", Int64);

julia> G = SimpleGraph(A);

julia> bG, bX = b_VectorsBruteForce(G);

julia> bG
1.6666666666666665

julia> bX
5×8 Matrix{Float64}:
 -0.25      -0.25       0.166667   0.166667  -0.166667  -0.166667   0.25       0.25
 -0.25       0.166667  -0.25       0.166667  -0.166667   0.25      -0.166667   0.25
  0.166667  -0.25       0.166667  -0.25       0.25      -0.166667   0.25      -0.166667
  0.166667   0.166667  -0.25      -0.25       0.25       0.25      -0.166667  -0.166667
  0.166667   0.166667   0.166667   0.166667  -0.166667  -0.166667  -0.166667  -0.166667

julia> k = rank(bX)
3

julia> fig = plot(); GraphVectsPlot(G,bX[:,1:3]);

julia> savefig(fig,"./out/L1SD_graph_442.png")
```

![L1SD_graph_442](./out/L1SD_graph_442.png)


| id   | Name               | b(G)    | size(bX) | rank(bX) | B(G)    | size(BX)   | rank(BX) |
|------|--------------------|---------|----------|----------|---------|------------|----------|
|      | P_2                | 1.0     | (2, 2)   | 1        | 1.0     | (2, 2)     | 1        |
|      | P_3                | 0.75    | (3, 4)   | 2        | 1.5     | (3, 6)     | 2        |
|      | P_4                | 0.5     | (4, 2)   | 1        | 2.0     | (4, 2)     | 1        | 
|      | P_5                | 0.41667 | (5, 4)   | 2        | 2.0     | (5, 8)     | 2        | 
|      | P_6                | 0.33333 | (6, 2)   | 1        | 2.0     | (6, 26)    | 3        |
|      | P_7                | 0.29167 | (7, 4)   | 2        | 2.0     | (7, 74)    | 4        | 
|      | P_8                | 0.25    | (8, 2)   | 1        | 2.0     | (8, 198)   | 5        |
|      | P_9                | 0.225   | (9, 4)   | 2        | 2.0     | (9, 510)   | 6        |
| 74   | Tetrahedral Graph  | 2.0     | (4, 14)  | 3        | 3.0     | (4, 12)    | 3        |
| 226  | Octahedral Graph   | 2.0     | (6, 8)   | 3        | 4.0     | (6, 60)    | 5        |
| 1022 | Cubical Graph      | 1.0     | (8, 6)   | 3        | 3.0     | (8, 674)   | 7        |
| 1043 | Dodecahedral Graph |         |          |          |         |            |          |
| 1186 | Icosahedral Graph  | 1.66667 | (12,12)  | 6        | 5.0     | (12, 3152) | 11       |
| 264  | K_{2,3}            | 1.25    | (5,18)   | 4        | 3.0     | (5, 2)     | 1        |
| 84   | K_{3,3}            | 1.5     | (6,18)   | 4        | 3.0     | (6, 122)   | 5        |
| 442  | W_5                | 1.66667 | (5,8)    | 3        | 3.5     | (5, 12)    | 4        |
| 462  | K_5                | 2.5     | (5,30)   | 4        | 4.0     | (5, 20)    | 4        |
