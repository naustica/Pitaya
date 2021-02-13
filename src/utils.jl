function filter_handler(x::Union{Nothing, Dict{String, String}})

    if isnothing(x)
        return nothing
    end

    nn = ""
    for (k, v) in x
        nn = string(nn, k, ':', v, ',')
    end
    return nn

end
