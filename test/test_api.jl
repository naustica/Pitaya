using HTTP

include("../src/api.jl")

@testset "api" begin

    @test works(doi="10.1038/nature12373") isa Dict

    @test works(query="Heisenberg", limit=1) isa Dict

    @test members(member_id=98, works=true, limit=1) isa Dict

    @test funders(funder_id="10.13039/100000001", works=true, limit=1) isa Dict

    @test types(type_id="reference-book", works=true, limit=1) isa Dict

    @test prefixes(owner_prefix="10.1016", works=true, limit=1) isa Dict

    @test licenses(query="creative", limit=1) isa Dict

end
