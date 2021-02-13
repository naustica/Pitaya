module Pitaya

include("api.jl")

#print(works(query="Heisenberg", limit=1))

#print(works(doi="10.1038/nature12373"))

#print(members(member_id=98, works=true, limit=5))

#print(funders(funder_id="10.13039/100000001", works=true, limit=5))

#print(types(type_id="reference-book", works=true, limit=1))

#print(prefixes(owner_prefix="10.1016", works=true, limit=1))

#print(licenses(query="creative", limit=1))

export works, members, funders, journals, types, prefixes, licenses

end # module
