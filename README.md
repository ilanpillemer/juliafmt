# NB

Do not use dnf or other ways of installing julia. You must use the Julia way or
PackageCompiler wont work.

```
curl -fsSL https://install.julialang.org | sh
```

# The rest, if you obeyed the above will work.

PackageCompiler is used to turn this into a binary that acme
can use to reformat a julia file in place.

```

(@v1.11) pkg> add .
     Cloning git-repo `/home/ilanpillemer/Repos/github/juliafmt`
    Updating git-repo `/home/ilanpillemer/Repos/github/juliafmt`

<snip>

(@v1.11) pkg> activate .
  Activating project at `~/Repos/github/juliafmt`

(juliafmt) pkg> resolve
  No Changes to `~/Repos/github/juliafmt/Project.toml`
    Updating `~/Repos/github/juliafmt/Manifest.toml`

(juliafmt) pkg> update
    Updating registry at `~/.julia/registries/General.toml`
    Updating `~/Repos/github/juliafmt/Project.toml`
  [98e50ef6] ↑ JuliaFormatter v1.0.45 ⇒ v2.1.2
  [9b87118b] ↑ PackageCompiler v2.1.16 ⇒ v2.2.0
  [295af30f] ↑ Revise v3.5.10 ⇒ v3.7.6
    Updating `~/Repos/github/juliafmt/Manifest.toml`


julia> using PackageCompiler
 │ Package PackageCompiler not found, but a package named PackageCompiler is available from a registry.
 │ Install package?
 │   (@v1.11) pkg> add PackageCompiler
 └ (y/n/o) [y]: y
   Resolving package versions...
    Updating `~/.julia/environments/v1.11/Project.toml`
  [9b87118b] + PackageCompiler v2.2.0
  No Changes to `~/.julia/environments/v1.11/Manifest.toml`

  julia> create_app(".","jlfmt2",include_lazy_artifacts=true)
┌ Warning: The active manifest file has dependencies that were resolved with a different julia version (1.9.4). Unexpected behavior may occur.
└ @ ~/Repos/github/juliafmt/Manifest.toml:0

```