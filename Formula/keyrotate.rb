class Keyrotate < Formula
  desc "Rotate & sync secrets across Vercel/Cloud Run/GCP SM/Koyeb/GH Actions/Atlas + local .env"
  homepage "https://github.com/sophie4869/keyrotate"
  url "https://github.com/sophie4869/keyrotate/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "21c2a3e1e7df8aea855f4071c9a6d9efca3cc650aa3dfa29d478845cb92d5a68"
  license "MIT"

  depends_on "jq"
  depends_on "gh" => :recommended

  def install
    bin.install "bin/secret" => "secret"
    (pkgshare/"examples").install Dir["examples/*"]
    doc.install "README.md", "SCHEMA.md", "CHANGELOG.md"
  end

  def caveats
    <<~EOS
      keyrotate configs live in ~/.config/keyrotate/*.json
      Alias file (short project names): ~/.config/keyrotate/_aliases.json

      Provider credentials are read from macOS Keychain (services vary by target):
        atlas-api       — MongoDB Atlas Admin API pub/priv key pair
        vercel-api      — Vercel token
        koyeb-api       — Koyeb token
        (gcloud uses its own auth via gcloud CLI)

      See #{opt_share}/keyrotate/README.md for full setup + provider matrix,
      and #{opt_share}/keyrotate/examples/managing-secrets.SKILL.md for
      the Claude Code skill template.
    EOS
  end

  test do
    # Basic smoke — the CLI prints usage when invoked with no args.
    assert_match "secret ls", shell_output("#{bin}/secret 2>&1", 1)
  end
end
