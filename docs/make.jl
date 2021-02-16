using Documenter, Pitaya

makedocs(sitename="Pitaya",
         modules = [Pitaya],
         authors="Nick Haupka",
         pages=[
            "API reference" => "index.md"])

deploydocs(;
  repo="github.com/naustica/Pitaya.git",
  devbranch = "main",
  devurl = "latest",
)
