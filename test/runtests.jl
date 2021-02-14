using Pitaya
using Test

const dir = joinpath(dirname(pathof(Pitaya)), "..", "test")

@testset "Pitaya module" begin

    for f in ["test_utils.jl",
              "test_network.jl",
              "test_api.jl"]
        file = joinpath(dir, f)
        println("Running $f tests...")
        if isfile(file)
            include(file)
        else
            @show readdir(dirname(file))
        end
    end
end
