# Pitaya

[![CI](https://github.com/naustica/Pitaya/workflows/CI/badge.svg)](https://github.com/naustica/Pitaya/actions?query=workflow%3ACI)
[![License](https://img.shields.io/github/license/naustica/Pitaya)](https://github.com/naustica/Pitaya/blob/main/LICENSE.txt)

A Julia interface to the [Crossref REST API](https://github.com/CrossRef/rest-api-doc). Inspired by [habanero](https://github.com/sckott/habanero).

## Usage

```Julia
using Pitaya

ENV["JULIA_MAILTO"] = "nick.haupka@gmail.com"
works(query="Heisenberg", limit=1)
```
