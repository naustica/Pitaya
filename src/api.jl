using JSON

include("network.jl")


"""
    works(; kwargs...)

Arguments:
- `doi::Union{Nothing, String}`: DOI of the work.
- `query::Union{Nothing, String}`: A query string.
- `filter::Union{Nothing, Dict{String, String}}`: Filter options.
- `offset::Union{Nothing, Int}`: Number of record to start at.
- `limit::Union{Nothing, Int}`: Number of results to return.
- `sample::Union{Nothing, Int}`: Number of random results to return.
- `sort::Union{Nothing, String}`: Field to sort on.
- `order::Union{Nothing, String}`: Sort order, one of ‘asc’ or ‘desc’.
- `facet::Union{Nothing, Dict{String, Int}}`: Facet options.
- `select::Union{Nothing, String}`: Select specific fields.
- `cursor::Union{Nothing, String}`: Cursor character string to do deep paging.

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
- `member_id::Union{Nothing, Int}`: ID of a Crossref member.
- `query::Union{Nothing, String}`: A query string.
- `filter::Union{Nothing, Dict{String, String}}`: Filter options.
- `offset::Union{Nothing, Int}`: Number of record to start at.
- `limit::Union{Nothing, Int}`: Number of results to return.
- `sample::Union{Nothing, Int}`: Number of random results to return.
- `sort::Union{Nothing, String}`: Field to sort on.
- `order::Union{Nothing, String}`: Sort order, one of ‘asc’ or ‘desc’.
- `facet::Union{Nothing, Dict{String, Int}}`: Facet options.
- `select::Union{Nothing, String}`: Select specific fields.
- `works::Bool`: If true, works returned as well.
- `cursor::Union{Nothing, String}`: Cursor character string to do deep paging.

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
- `funder_id::Union{Nothing, String}`: ID of a funder.
- `query::Union{Nothing, String}`: A query string.
- `filter::Union{Nothing, Dict{String, String}}`: Filter options.
- `offset::Union{Nothing, Int}`: Number of record to start at.
- `limit::Union{Nothing, Int}`: Number of results to return.
- `sample::Union{Nothing, Int}`: Number of random results to return.
- `sort::Union{Nothing, String}`: Field to sort on.
- `order::Union{Nothing, String}`: Sort order, one of ‘asc’ or ‘desc’.
- `facet::Union{Nothing, Dict{String, Int}}`: Facet options.
- `select::Union{Nothing, String}`: Select specific fields.
- `works::Bool`: If true, works returned as well.
- `cursor::Union{Nothing, String}`: Cursor character string to do deep paging.

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
- `issn::Union{Nothing, String}`: A issn of a journal.
- `query::Union{Nothing, String}`: A query string.
- `filter::Union{Nothing, Dict{String, String}}`: Filter options.
- `offset::Union{Nothing, Int}`: Number of record to start at.
- `limit::Union{Nothing, Int}`: Number of results to return.
- `sample::Union{Nothing, Int}`: Number of random results to return.
- `sort::Union{Nothing, String}`: Field to sort on.
- `order::Union{Nothing, String}`: Sort order, one of ‘asc’ or ‘desc’.
- `facet::Union{Nothing, Dict{String, Int}}`: Facet options.
- `select::Union{Nothing, String}`: Select specific fields.
- `works::Bool`: If true, works returned as well.
- `cursor::Union{Nothing, String}`: Cursor character string to do deep paging.

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
- `type_id::Union{Nothing, String}`: ID of a metadata work type.
- `query::Union{Nothing, String}`: A query string.
- `filter::Union{Nothing, Dict{String, String}}`: Filter options.
- `offset::Union{Nothing, Int}`: Number of record to start at.
- `limit::Union{Nothing, Int}`: Number of results to return.
- `sample::Union{Nothing, Int}`: Number of random results to return.
- `sort::Union{Nothing, String}`: Field to sort on.
- `order::Union{Nothing, String}`: Sort order, one of ‘asc’ or ‘desc’.
- `facet::Union{Nothing, Dict{String, Int}}`: Facet options.
- `select::Union{Nothing, String}`: Select specific fields.
- `works::Bool`: If true, works returned as well.
- `cursor::Union{Nothing, String}`: Cursor character string to do deep paging.

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
- `owner_prefix::Union{Nothing, String}`: A DOI owner prefix.
- `query::Union{Nothing, String}`: A query string.
- `filter::Union{Nothing, Dict{String, String}}`: Filter options.
- `offset::Union{Nothing, Int}`: Number of record to start at.
- `limit::Union{Nothing, Int}`: Number of results to return.
- `sample::Union{Nothing, Int}`: Number of random results to return.
- `sort::Union{Nothing, String}`: Field to sort on.
- `order::Union{Nothing, String}`: Sort order, one of ‘asc’ or ‘desc’.
- `facet::Union{Nothing, Dict{String, Int}}`: Facet options.
- `select::Union{Nothing, String}`: Select specific fields.
- `works::Bool`: If true, works returned as well.
- `cursor::Union{Nothing, String}`: Cursor character string to do deep paging.

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
- `query::Union{Nothing, String}`: A query string.
- `offset::Union{Nothing, Int}`: Number of record to start at.
- `limit::Union{Nothing, Int}`: Number of results to return.
- `sample::Union{Nothing, Int}`: Number of random results to return.
- `sort::Union{Nothing, String}`: Field to sort on.
- `order::Union{Nothing, String}`: Sort order, one of ‘asc’ or ‘desc’.
- `facet::Union{Nothing, Dict{String, Int}}`: Facet options.

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


"""
    agency(doi)

Arguments:
- `doi::String`: DOI of the work.

Returns:
- Dict
"""
function agency(doi::String)

    url = string("https://api.crossref.org/works/", doi, "/agency")

    r = request(url=url)

    return JSON.parse(String(r.body))

end
