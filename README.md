# homebrew-attic

The Homebrew tap for [attic](https://github.com/sergiommarcial/attic), an
offline disk explorer for macOS.

## Install

```sh
brew tap sergiommarcial/attic
brew trust sergiommarcial/attic   # Homebrew asks you to trust third-party taps
brew install sergiommarcial/attic/attic
brew services start attic         # the background service, now and at login
```

Then grant Full Disk Access to the binary `attic status` names (System
Settings, Privacy & Security, Full Disk Access) and run
`brew services restart attic`. Each upgrade installs a new binary, so grant
it again after `brew upgrade attic`.

attic builds from source. Homebrew installs its `rust` formula as a build
dependency; `brew autoremove` removes it afterwards.

## How the formula gets here

attic's release workflow writes `Formula/attic.rb` from the template in
attic's `packaging/homebrew/` each time a version is tagged, and pushes it
here. Don't edit it by hand; change the template in attic instead.

## License

MIT, see [LICENSE](LICENSE).
