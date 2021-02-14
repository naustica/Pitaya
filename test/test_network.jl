using HTTP

include("../src/network.jl")

@testset "network" begin

    r = request(url="https://api.crossref.org/works",
                query="Heisenberg",
                filter=nothing,
                offset=nothing,
                limit=1,
                sample=nothing,
                sort=nothing,
                order=nothing,
                facet=nothing,
                select=nothing,
                cursor=nothing)

    @test r.status == 200

    let err = nothing
        try
            request(url="https://api.crossref.org/works", offset=11000)
        catch err
        end

        @test err isa Exception
        @test sprint(showerror, err) == "Offset; Max: 10000"

        try
            request(url="https://api.crossref.org/works", sample=500)
        catch err
        end

        @test err isa Exception
        @test sprint(showerror, err) == "Sample size; Max: 100"

    end

end
