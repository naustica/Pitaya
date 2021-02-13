module Pitaya

include("api.jl")

#works(query="Heisenberg", limit=1)

#works(doi="10.1038/nature12373")

#members(member_id=98, works=true, limit=5)

#funders(funder_id="10.13039/100000001", works=true, limit=5)

#types(type_id="reference-book", works=true, limit=1)

#prefixes(owner_prefix="10.1016", works=true, limit=1)

export works, members, funders, journals, types, prefixes

end # module
