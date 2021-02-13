using HTTP
using JSON

include("utils.jl")

function request(; url::String,
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

        headers = (("User-Agent", string("mailto:", ENV["JULIA_MAILTO"])),
                  ("X-USER-AGENT", string(ENV["JULIA_MAILTO"])))

        payload = Dict("query" => query,
                       "filter" => filter_handler(filter),
                       "offset" => offset,
                       "rows" => limit,
                       "sample" => sample,
                       "sort" => sort,
                       "order" => order,
                       "facet" => facet,
                       "select" => select,
                       "cursor" => cursor)

        for (k, v) in payload
                if isnothing(v)
                        delete!(payload, k)
                end
        end

        r = HTTP.get(url, headers; query=payload)
        print(JSON.parse(String(r.body)))
end
