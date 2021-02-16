# Pitaya

[![CI](https://github.com/naustica/Pitaya/workflows/CI/badge.svg)](https://github.com/naustica/Pitaya/actions?query=workflow%3ACI)
[![Package - Version](https://img.shields.io/badge/version-v0.1-blue)]()
[![Documentation Status](https://img.shields.io/badge/docs-stable-green)](github.com/naustica/Pitaya)
[![License](https://img.shields.io/github/license/naustica/Pitaya)](https://github.com/naustica/Pitaya/blob/main/LICENSE.txt)

A Julia interface to the [Crossref REST API](https://github.com/CrossRef/rest-api-doc). Inspired by [habanero](https://github.com/sckott/habanero).

## Install

```bash
(v1.5) pkg> add https://github.com/naustica/Pitaya
```

## Usage

```Julia
using Pitaya

ENV["MAILTO"] = "nick.haupka@gmail.com"
```

### Works

```Julia
works(query="Heisenberg", limit=1)
```

```Julia
works(doi="10.1038/nature12373")
```

### Members

```Julia
members(member_id=98, works=true, limit=5, sort="updated")
```

### Funders

```Julia
funders(funder_id="10.13039/100000001", works=true, limit=5)
```

### Journals

```Julia
journals(issn="1549-7712", works=true, offset=20, limit=10)
```

### Types

```Julia
types(type_id="reference-book", works=true, sample=20)
```

### Prefixes

```Julia
prefixes(owner_prefix="10.1016", works=true, order="desc", limit=20)
```

### Licenses

```Julia
licenses(query="creative", limit=3)
```
