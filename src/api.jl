using JSON

include("network.jl")


"""
    works(; kwargs...)

Arguments:
- `doi::Union{Nothing, String}`: DESCRIPTION
- `query::Union{Nothing, String}`: DESCRIPTION
- `filter::Union{Nothing, Dict{String, String}}`: DESCRIPTION
- `offset::Union{Nothing, Int}`: DESCRIPTION
- `limit::Union{Nothing, Int}`: DESCRIPTION
- `sample::Union{Nothing, Int}`: DESCRIPTION
- `sort::Union{Nothing, String}`: DESCRIPTION
- `order::Union{Nothing, String}`: DESCRIPTION
- `facet::Union{Nothing, Dict{String, Int}}`: DESCRIPTION
- `select::Union{Nothing, String}`: DESCRIPTION
- `cursor::Union{Nothing, String}`: DESCRIPTION

Returns:
- Dict
"""
function works(; doi::Union{Nothing, String}=nothing,
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

    url = "https://api.crossref.org/works"

    if !isnothing(doi)
            url = string(url, "/", doi)
            r = request(url=url)
            return JSON.parse(String(r.body))
    end

    r = request(url=url,
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

    return JSON.parse(String(r.body))

end


"""
    members(; kwargs...)

Arguments:
- `member_id::Union{Nothing, Int}`: DESCRIPTION
- `query::Union{Nothing, String}`: DESCRIPTION
- `filter::Union{Nothing, Dict{String, String}}`: DESCRIPTION
- `offset::Union{Nothing, Int}`: DESCRIPTION
- `limit::Union{Nothing, Int}`: DESCRIPTION
- `sample::Union{Nothing, Int}`: DESCRIPTION
- `sort::Union{Nothing, String}`: DESCRIPTION
- `order::Union{Nothing, String}`: DESCRIPTION
- `facet::Union{Nothing, Dict{String, Int}}`: DESCRIPTION
- `select::Union{Nothing, String}`: DESCRIPTION
- `works::Bool`: DESCRIPTION
- `cursor::Union{Nothing, String}`: DESCRIPTION

Returns:
- Dict
"""
function members(; member_id::Union{Nothing, Int}=nothing,
                 query::Union{Nothing, String}=nothing,
                 filter::Union{Nothing, Dict{String, String}}=nothing,
                 offset::Union{Nothing, Int}=nothing,
                 limit::Union{Nothing, Int}=nothing,
                 sample::Union{Nothing, Int}=nothing,
                 sort::Union{Nothing, String}=nothing,
                 order::Union{Nothing, String}=nothing,
                 facet::Union{Nothing, Dict{String, Int}}=nothing,
                 select::Union{Nothing, String}=nothing,
                 works::Bool=false,
                 cursor::Union{Nothing, String}=nothing)

        url="https://api.crossref.org/members"

        if !isnothing(member_id)
                url = string(url, "/", member_id)
                if works
                        url = string(url, "/works")
                else
                        r = request(url=url)
                        return JSON.parse(String(r.body))
                end

        end

        r = request(url=url,
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

        return JSON.parse(String(r.body))

end


"""
    funders(; kwargs...)

Arguments:
- `funder_id::Union{Nothing, String}`: DESCRIPTION
- `query::Union{Nothing, String}`: DESCRIPTION
- `filter::Union{Nothing, Dict{String, String}}`: DESCRIPTION
- `offset::Union{Nothing, Int}`: DESCRIPTION
- `limit::Union{Nothing, Int}`: DESCRIPTION
- `sample::Union{Nothing, Int}`: DESCRIPTION
- `sort::Union{Nothing, String}`: DESCRIPTION
- `order::Union{Nothing, String}`: DESCRIPTION
- `facet::Union{Nothing, Dict{String, Int}}`: DESCRIPTION
- `select::Union{Nothing, String}`: DESCRIPTION
- `works::Bool`: DESCRIPTION
- `cursor::Union{Nothing, String}`: DESCRIPTION

Returns:
- `Dict`
"""
function funders(; funder_id::Union{Nothing, String}=nothing,
                 query::Union{Nothing, String}=nothing,
                 filter::Union{Nothing, Dict{String, String}}=nothing,
                 offset::Union{Nothing, Int}=nothing,
                 limit::Union{Nothing, Int}=nothing,
                 sample::Union{Nothing, Int}=nothing,
                 sort::Union{Nothing, String}=nothing,
                 order::Union{Nothing, String}=nothing,
                 facet::Union{Nothing, Dict{String, Int}}=nothing,
                 select::Union{Nothing, String}=nothing,
                 works::Bool=false,
                 cursor::Union{Nothing, String}=nothing)

        url="https://api.crossref.org/funders"

        if !isnothing(funder_id)
                url = string(url, "/", funder_id)
                if works
                        url = string(url, "/works")
                else
                        r = request(url=url)
                        return JSON.parse(String(r.body))
                end

        end

        r =  request(url=url,
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

        return JSON.parse(String(r.body))

end


"""
    journals(; kwargs...)

Arguments:
- `issn::Union{Nothing, String}`: DESCRIPTION
- `query::Union{Nothing, String}`: DESCRIPTION
- `filter::Union{Nothing, Dict{String, String}}`: DESCRIPTION
- `offset::Union{Nothing, Int}`: DESCRIPTION
- `limit::Union{Nothing, Int}`: DESCRIPTION
- `sample::Union{Nothing, Int}`: DESCRIPTION
- `sort::Union{Nothing, String}`: DESCRIPTION
- `order::Union{Nothing, String}`: DESCRIPTION
- `facet::Union{Nothing, Dict{String, Int}}`: DESCRIPTION
- `select::Union{Nothing, String}`: DESCRIPTION
- `works::Bool`: DESCRIPTION
- `cursor::Union{Nothing, String}`: DESCRIPTION

Returns:
- `Dict`
"""
function journals(; issn::Union{Nothing, String}=nothing,
                  query::Union{Nothing, String}=nothing,
                  filter::Union{Nothing, Dict{String, String}}=nothing,
                  offset::Union{Nothing, Int}=nothing,
                  limit::Union{Nothing, Int}=nothing,
                  sample::Union{Nothing, Int}=nothing,
                  sort::Union{Nothing, String}=nothing,
                  order::Union{Nothing, String}=nothing,
                  facet::Union{Nothing, Dict{String, Int}}=nothing,
                  select::Union{Nothing, String}=nothing,
                  works::Bool=false,
                  cursor::Union{Nothing, String}=nothing)


        url="https://api.crossref.org/journals"

        if !isnothing(issn)
                url = string(url, "/", issn)
                if works
                        url = string(url, "/works")
                else
                        r = request(url=url)
                        return JSON.parse(String(r.body))
                end

        end

        r = request(url=url,
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

        return JSON.parse(String(r.body))

end


"""
    types(; kwargs...)

Arguments:
- `type_id::Union{Nothing, String}`: DESCRIPTION
- `query::Union{Nothing, String}`: DESCRIPTION
- `filter::Union{Nothing, Dict{String, String}}`: DESCRIPTION
- `offset::Union{Nothing, Int}`: DESCRIPTION
- `limit::Union{Nothing, Int}`: DESCRIPTION
- `sample::Union{Nothing, Int}`: DESCRIPTION
- `sort::Union{Nothing, String}`: DESCRIPTION
- `order::Union{Nothing, String}`: DESCRIPTION
- `facet::Union{Nothing, Dict{String, Int}}`: DESCRIPTION
- `select::Union{Nothing, String}`: DESCRIPTION
- `works::Bool`: DESCRIPTION
- `cursor::Union{Nothing, String}`: DESCRIPTION

Returns:
- `Dict`
"""
function types(; type_id::Union{Nothing, String}=nothing,
               query::Union{Nothing, String}=nothing,
               filter::Union{Nothing, Dict{String, String}}=nothing,
               offset::Union{Nothing, Int}=nothing,
               limit::Union{Nothing, Int}=nothing,
               sample::Union{Nothing, Int}=nothing,
               sort::Union{Nothing, String}=nothing,
               order::Union{Nothing, String}=nothing,
               facet::Union{Nothing, Dict{String, Int}}=nothing,
               select::Union{Nothing, String}=nothing,
               works::Bool=false,
               cursor::Union{Nothing, String}=nothing)

         url="https://api.crossref.org/types"

         if !isnothing(type_id)
                 url = string(url, "/", type_id)
                 if works
                         url = string(url, "/works")
                 else
                         r = request(url=url)
                         return JSON.parse(String(r.body))
                 end

         end

         r = request(url=url,
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

        return JSON.parse(String(r.body))

end


"""
    prefixes(; kwargs...)

Arguments:
- `owner_prefix::Union{Nothing, String}`: DESCRIPTION
- `query::Union{Nothing, String}`: DESCRIPTION
- `filter::Union{Nothing, Dict{String, String}}`: DESCRIPTION
- `offset::Union{Nothing, Int}`: DESCRIPTION
- `limit::Union{Nothing, Int}`: DESCRIPTION
- `sample::Union{Nothing, Int}`: DESCRIPTION
- `sort::Union{Nothing, String}`: DESCRIPTION
- `order::Union{Nothing, String}`: DESCRIPTION
- `facet::Union{Nothing, Dict{String, Int}}`: DESCRIPTION
- `select::Union{Nothing, String}`: DESCRIPTION
- `works::Bool`: DESCRIPTION
- `cursor::Union{Nothing, String}`: DESCRIPTION

Returns:
- `Dict`
"""
function prefixes(; owner_prefix::Union{Nothing, String}=nothing,
                  query::Union{Nothing, String}=nothing,
                  filter::Union{Nothing, Dict{String, String}}=nothing,
                  offset::Union{Nothing, Int}=nothing,
                  limit::Union{Nothing, Int}=nothing,
                  sample::Union{Nothing, Int}=nothing,
                  sort::Union{Nothing, String}=nothing,
                  order::Union{Nothing, String}=nothing,
                  facet::Union{Nothing, Dict{String, Int}}=nothing,
                  select::Union{Nothing, String}=nothing,
                  works::Bool=false,
                  cursor::Union{Nothing, String}=nothing)

         url="https://api.crossref.org/prefixes"

         if !isnothing(owner_prefix)
                 url = string(url, "/", owner_prefix)
                 if works
                         url = string(url, "/works")
                 else
                         r = request(url=url)
                         return JSON.parse(String(r.body))
                 end

         end

         r = request(url=url,
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

        return JSON.parse(String(r.body))

end


"""
    licenses(; kwargs...)

Arguments:
- `query::Union{Nothing, String}`: DESCRIPTION
- `offset::Union{Nothing, Int}`: DESCRIPTION
- `limit::Union{Nothing, Int}`: DESCRIPTION
- `sample::Union{Nothing, Int}`: DESCRIPTION
- `sort::Union{Nothing, String}`: DESCRIPTION
- `order::Union{Nothing, String}`: DESCRIPTION
- `facet::Union{Nothing, Dict{String, Int}}`: DESCRIPTION

Returns:
- `Dict`
"""
function licenses(; query::Union{Nothing, String}=nothing,
                  offset::Union{Nothing, Int}=nothing,
                  limit::Union{Nothing, Int}=nothing,
                  sample::Union{Nothing, Int}=nothing,
                  sort::Union{Nothing, String}=nothing,
                  order::Union{Nothing, String}=nothing,
                  facet::Union{Nothing, Dict{String, Int}}=nothing)

         url="https://api.crossref.org/licenses"

         r = request(url=url,
                     query=query,
                     offset=offset,
                     limit=limit,
                     sample=sample,
                     sort=sort,
                     order=order,
                     facet=facet)

        return JSON.parse(String(r.body))

end
