jkassis/dist.brew.pub
=====================
Homebrew tap for jkassis's publicly distributed apps & tools.

## Install

One of these...
```
brew tap jkassis/pub ssh://git@github.com/jkassis/dist.brew.pub
brew tap jkassis/pub https://github.com/jkassis/dist.brew.pub
```

## Packages

- gitall: cli for performing git operations to multiple repos at once.
- jarhc: terminal client for native Codex and Claude agent runtimes.
- layout: a macos window layout manager
- weave: local-first terminal and agent collaboration TUI.

## JarHC releases

Run the target-owned release entrypoint from a clean checkout after validating,
tagging, and pushing an exact clean JarHead source revision:

```sh
./release-jarhc VERSION CLEAN_SOURCE_WORKTREE
```

The entrypoint builds both macOS architectures with a persistent local Cargo
cache, publishes checksum-verified public assets, updates the formula, and
pushes the formula commit. It omits the Claude SDK's bundled executable because
JarHC passes the user's configured Claude executable to the SDK explicitly.


## Contributing

1. Fork it
1. Create your feature branch (`git checkout -b my-new-feature`)
1. Commit your changes (`git commit -am 'Add some feature'`)
1. Push to the branch (`git push origin my-new-feature`)
1. Create new Pull Request
