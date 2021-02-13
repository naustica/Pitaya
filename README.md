# Pitaya

A Julia interface to the [Crossref REST API](https://github.com/CrossRef/rest-api-doc). Inspired by [habanero](https://github.com/sckott/habanero).

## Usage

```Julia
using Pitaya

ENV["JULIA_MAILTO"] = "nick.haupka@gmail.com"
works(query="Heisenberg", limit=1)
```
