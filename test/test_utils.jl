include("../src/utils.jl")

@testset "utils" begin
  @test filter_handler(nothing) == nothing
  @test filter_handler(Dict("doi" => "10.1038/nature12373")) == "doi:10.1038/nature12373,"

end
