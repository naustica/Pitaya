module Pitaya

#base_url::String = "https://api.crossref.org"
#api_key::Union{Nothing, String} = nothing
#mailto::Union{Nothin, String} = nothing

#test_doi = "10.1038/nature12373"

include("api.jl")

works(query="Heisenberg", limit=1)

end # module
