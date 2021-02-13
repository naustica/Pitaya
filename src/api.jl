include("network.jl")


function works(; ids::Union{Nothing, String, Array{String}}=nothing,
               query::Union{Nothing, String}=nothing,
               filter::Union{Nothing, Dict{String, String}}=nothing,
               offset::Union{Nothing, Int}=nothing,
               limit::Union{Nothing, Int}=nothing,
               sample::Union{Nothing, Int}=nothing,
               sort::Union{Nothing, String}=nothing,
               order::Union{Nothing, String}=nothing,
               facet::Union{Nothing, Bool, String}=nothing,
               select::Union{Nothing, String}=nothing,
               cursor::Union{Nothing, String}=nothing)

    request(url="https://api.crossref.org/works",
            query=query,
            filter=filter,
            offset=offset,
            limit=limit,
            sample=sample,
            sort=sort,
            order=order,
            facet=facet,
            select=select,
            cursor=cursor)

end
