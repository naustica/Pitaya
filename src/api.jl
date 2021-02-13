include("network.jl")


function works(; doi::Union{Nothing, String}=nothing,
               query::Union{Nothing, String}=nothing,
               filter::Union{Nothing, Dict{String, String}}=nothing,
               offset::Union{Nothing, Int}=nothing,
               limit::Union{Nothing, Int}=nothing,
               sample::Union{Nothing, Int}=nothing,
               sort::Union{Nothing, String}=nothing,
               order::Union{Nothing, String}=nothing,
               facet::Union{Nothing, Dict{String, Union{String, Int}}}=nothing,
               select::Union{Nothing, String}=nothing,
               cursor::Union{Nothing, String}=nothing)

    url = "https://api.crossref.org/works"

    if !isnothing(doi)
            url = string(url, "/", doi)
            request(url=url)
            return
    end

    request(url=url,
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


function members(; member_id::Union{Nothing, Int}=nothing,
                 query::Union{Nothing, String}=nothing,
                 filter::Union{Nothing, Dict{String, String}}=nothing,
                 offset::Union{Nothing, Int}=nothing,
                 limit::Union{Nothing, Int}=nothing,
                 sample::Union{Nothing, Int}=nothing,
                 sort::Union{Nothing, String}=nothing,
                 order::Union{Nothing, String}=nothing,
                 facet::Union{Nothing, Dict{String, Union{String, Int}}}=nothing,
                 select::Union{Nothing, String}=nothing,
                 works::Bool=false,
                 cursor::Union{Nothing, String}=nothing)

        url="https://api.crossref.org/members"

        if !isnothing(member_id)
                url = string(url, "/", member_id)
                if works
                        url = string(url, "/works")
                else
                        request(url=url)
                        return
                end

        end

         request(url=url,
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


function funders(; funder_id::Union{Nothing, String}=nothing,
                 query::Union{Nothing, String}=nothing,
                 filter::Union{Nothing, Dict{String, String}}=nothing,
                 offset::Union{Nothing, Int}=nothing,
                 limit::Union{Nothing, Int}=nothing,
                 sample::Union{Nothing, Int}=nothing,
                 sort::Union{Nothing, String}=nothing,
                 order::Union{Nothing, String}=nothing,
                 facet::Union{Nothing, Dict{String, Union{String, Int}}}=nothing,
                 select::Union{Nothing, String}=nothing,
                 works::Bool=false,
                 cursor::Union{Nothing, String}=nothing)

         url="https://api.crossref.org/funders"

         if !isnothing(funder_id)
                 url = string(url, "/", funder_id)
                 if works
                         url = string(url, "/works")
                 else
                         request(url=url)
                         return
                 end

         end

          request(url=url,
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


function journals(; issn::Union{Nothing, String}=nothing,
                  query::Union{Nothing, String}=nothing,
                  filter::Union{Nothing, Dict{String, String}}=nothing,
                  offset::Union{Nothing, Int}=nothing,
                  limit::Union{Nothing, Int}=nothing,
                  sample::Union{Nothing, Int}=nothing,
                  sort::Union{Nothing, String}=nothing,
                  order::Union{Nothing, String}=nothing,
                  facet::Union{Nothing, Dict{String, Union{String, Int}}}=nothing,
                  select::Union{Nothing, String}=nothing,
                  works::Bool=false,
                  cursor::Union{Nothing, String}=nothing)


        url="https://api.crossref.org/journals"

        if !isnothing(issn)
                url = string(url, "/", issn)
                if works
                        url = string(url, "/works")
                else
                        request(url=url)
                        return
                end

        end

         request(url=url,
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


function types(; type_id::Union{Nothing, String}=nothing,
               query::Union{Nothing, String}=nothing,
               filter::Union{Nothing, Dict{String, String}}=nothing,
               offset::Union{Nothing, Int}=nothing,
               limit::Union{Nothing, Int}=nothing,
               sample::Union{Nothing, Int}=nothing,
               sort::Union{Nothing, String}=nothing,
               order::Union{Nothing, String}=nothing,
               facet::Union{Nothing, Dict{String, Union{String, Int}}}=nothing,
               select::Union{Nothing, String}=nothing,
               works::Bool=false,
               cursor::Union{Nothing, String}=nothing)

         url="https://api.crossref.org/types"

         if !isnothing(type_id)
                 url = string(url, "/", type_id)
                 if works
                         url = string(url, "/works")
                 else
                         request(url=url)
                         return
                 end

         end

          request(url=url,
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


function prefixes(; owner_prefix::Union{Nothing, String}=nothing,
                  query::Union{Nothing, String}=nothing,
                  filter::Union{Nothing, Dict{String, String}}=nothing,
                  offset::Union{Nothing, Int}=nothing,
                  limit::Union{Nothing, Int}=nothing,
                  sample::Union{Nothing, Int}=nothing,
                  sort::Union{Nothing, String}=nothing,
                  order::Union{Nothing, String}=nothing,
                  facet::Union{Nothing, Dict{String, Union{String, Int}}}=nothing,
                  select::Union{Nothing, String}=nothing,
                  works::Bool=false,
                  cursor::Union{Nothing, String}=nothing)

         url="https://api.crossref.org/prefixes"

         if !isnothing(owner_prefix)
                 url = string(url, "/", owner_prefix)
                 if works
                         url = string(url, "/works")
                 else
                         request(url=url)
                         return
                 end

         end

          request(url=url,
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


function licenses(; query::Union{Nothing, String}=nothing,
                  offset::Union{Nothing, Int}=nothing,
                  limit::Union{Nothing, Int}=nothing,
                  sample::Union{Nothing, Int}=nothing,
                  sort::Union{Nothing, String}=nothing,
                  order::Union{Nothing, String}=nothing,
                  facet::Union{Nothing, Dict{String, Union{String, Int}}}=nothing)

         url="https://api.crossref.org/licenses"

          request(url=url,
                  query=query,
                  offset=offset,
                  limit=limit,
                  sample=sample,
                  sort=sort,
                  order=order,
                  facet=facet)

end
