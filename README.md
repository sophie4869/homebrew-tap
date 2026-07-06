# sophie4869/homebrew-tap

Personal [Homebrew](https://brew.sh) tap for [@sophie4869](https://github.com/sophie4869)'s open-source tools.

## Install

```sh
brew install sophie4869/tap/<formula>
```

(Homebrew implicitly adds the `homebrew-` prefix when resolving `sophie4869/tap`, so this repo must stay named `homebrew-tap` exactly.)

## Formulae

| Formula | Description | Repo |
|---|---|---|
| `keyrotate` | Rotate & sync secrets across Vercel/Cloud Run/GCP SM/Koyeb/GH Actions/Atlas + local `.env` — values-free JSON configs, LLM-agent-safe. | [sophie4869/keyrotate](https://github.com/sophie4869/keyrotate) |

## Release process (for future formula updates)

1. Tag a new release in the upstream repo (e.g. `keyrotate v0.2.0`).
2. Compute the sha256:
   ```sh
   curl -sL https://github.com/sophie4869/keyrotate/archive/refs/tags/vX.Y.Z.tar.gz | shasum -a 256
   ```
3. Update `url` and `sha256` in `Formula/<formula>.rb`.
4. `brew install --build-from-source ./Formula/<formula>.rb` locally to smoke-test.
5. Commit + push to `main`.

## License

MIT — see [LICENSE](LICENSE).
