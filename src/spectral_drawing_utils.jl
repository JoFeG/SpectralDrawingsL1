using LinearAlgebra, Graphs, Plots, DelimitedFiles

function GraphVectsPlot(G,X)
    n, d = size(X)
    plt = plot!(
        ratio = 1
    )
    scatter!(
        eachcol(X)...,
        label = false,
        color = :black
    )
    for e in edges(G)
        plot!(
            eachcol(X[[src(e),dst(e)],:])...,
            label = false,
            color = :black
        )
    end
    return plt
end


function b_BruteForce1(G)
    n = nv(G)
    M = Inf
    for k = 1:3^n
        S1S2 = [mod(k÷3^i,3) for i=0:n-1]
        S1 = Int.(S1S2 .== 1)
        sum(S1) > 0 ? ξ1 = karger_cut_cost(G,S1)/sum(S1) : ξ1 = Inf
        S2 = Int.(S1S2 .== 2)
        sum(S2) > 0 ? ξ2 = karger_cut_cost(G,S2)/sum(S2) : ξ2 = Inf
        M = min(M,(ξ1 + ξ2)/2)
    end
    return M
end

function b_VectorsBruteForce(G)
    bG = bBruteForce1(G)
    n = nv(G)
    X = Array{Float64}(undef, n, 0)
    for k = 1:3^n
        S1S2 = [mod(k÷3^i,3) for i=0:n-1]
        S1 = Int.(S1S2 .== 1)
        sum(S1) > 0 ? ξ1 = karger_cut_cost(G,S1)/sum(S1) : ξ1 = Inf
        S2 = Int.(S1S2 .== 2)
        sum(S2) > 0 ? ξ2 = karger_cut_cost(G,S2)/sum(S2) : ξ2 = Inf
        if bG == (ξ1 + ξ2)/2
            V = S1 ./ 2sum(S1) - S2 ./ 2sum(S2) 
            X = cat(X,V,dims=2)
        end
    end
    return bG, X
end

function B_BruteForce1(G)
    n = nv(G)
    M = -Inf
    for k = 1:3^n
        S1S2 = [mod(k÷3^i,3) for i=0:n-1]
        S1 = Int.(S1S2 .== 1)
        sum(S1) > 0 ? ξ1 = karger_cut_cost(G,S1)/sum(S1) : ξ1 = -Inf
        S2 = Int.(S1S2 .== 2)
        sum(S2) > 0 ? ξ2 = karger_cut_cost(G,S2)/sum(S2) : ξ2 = -Inf
        M = max(M,(ξ1 + ξ2)/2)
    end
    return M
end

function B_VectorsBruteForce(G)
    BG = B_BruteForce1(G)
    n = nv(G)
    X = Array{Float64}(undef, n, 0)
    for k = 1:3^n
        S1S2 = [mod(k÷3^i,3) for i=0:n-1]
        S1 = Int.(S1S2 .== 1)
        sum(S1) > 0 ? ξ1 = karger_cut_cost(G,S1)/sum(S1) : ξ1 = -Inf
        S2 = Int.(S1S2 .== 2)
        sum(S2) > 0 ? ξ2 = karger_cut_cost(G,S2)/sum(S2) : ξ2 = -Inf
        if BG == (ξ1 + ξ2)/2
            V = S1 ./ 2sum(S1) - S2 ./ 2sum(S2) 
            X = cat(X,V,dims=2)
        end
    end
    return BG, X
end