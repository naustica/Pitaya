using HTTP

include("utils.jl")

function request(; url::String,
                 query::Union{Nothing, String}=nothing,
                 filter::Union{Nothing, Dict{String, String}}=nothing,
                 offset::Union{Nothing, Int}=nothing,
                 limit::Union{Nothing, Int}=nothing,
                 sample::Union{Nothing, Int}=nothing,
                 sort::Union{Nothing, String}=nothing,
                 order::Union{Nothing, String}=nothing,
                 facet::Union{Nothing, Dict{String, Int}}=nothing,
                 select::Union{Nothing, String}=nothing,
                 cursor::Union{Nothing, String}=nothing)

        if !isnothing(offset)
                if offset > 10000 # max offset
                        error("Offset; Max: 10000")
                end
        end

        if !isnothing(sample)
                if sample > 100 # max sample size
                        error("Sample size; Max: 100")
                end
        end

        headers = []

        try
                push!(headers, ("User-Agent", string("mailto:", ENV["MAILTO"])))
                push!(headers, ("X-USER-AGENT", string(ENV["MAILTO"])))
        catch e
                #println(e)
        end

        try
                push!(headers, ("Crossref-Plus-API-Token", string(ENV["CROSSREF_PLUS_API_TOKEN"])))
        catch e
                #println(e)
        end

        payload = Dict("query" => query,
                       "filter" => filter_handler(filter),
                       "offset" => offset,
                       "rows" => limit,
                       "sample" => sample,
                       "sort" => sort,
                       "order" => order,
                       "facet" => filter_handler(facet),
                       "select" => select,
                       "cursor" => cursor)

        for (k, v) in payload
                if isnothing(v)
                        delete!(payload, k)
                end
        end

        return HTTP.get(url, headers; query=payload)
end
