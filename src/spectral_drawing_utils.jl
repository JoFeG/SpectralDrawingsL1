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