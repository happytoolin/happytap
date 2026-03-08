class Hni < Formula
  desc "ni-compatible package manager command router with node shim"
  homepage "https://github.com/happytoolin/hni"
  version "0.0.1-alpha-3"
  license "GPL-3.0"

  on_macos do
    on_arm do
      url "https://github.com/happytoolin/hni/releases/download/v#{version}/hni-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "2897d159e68c904f9ebbe7bd29e0e90e6b4b350d57a878d4286e23e362fa06c3"
    end
    on_intel do
      url "https://github.com/happytoolin/hni/releases/download/v#{version}/hni-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "0ca956d7787c1e4d7c40bb58f3110c56b796ddd782d3ab7e0e1e650e14e174ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/happytoolin/hni/releases/download/v#{version}/hni-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6da6d06c91b6ce5ee2ff445e20fce08c6043e15c1500cfd486e5e7dbc3e67182"
    end
    on_intel do
      url "https://github.com/happytoolin/hni/releases/download/v#{version}/hni-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4119b737a486e0a002912d4a1e480250f09469e4f8404c01da7e7253d0f55e09"
    end
  end

  def install
    bin.install "hni"
    %w[ni nr nlx nu nun nci na np ns].each do |name|
      bin.install_symlink bin/"hni" => name
    end
    generate_completions_from_executable(bin/"hni", "completion", shells: [:bash, :zsh, :fish])
  end

  def caveats
    <<~EOS
      Add the hni init line at the end of your shell config, after nvm/mise/asdf/fnm/volta init:

        zsh:  eval "$(hni init zsh)"
        bash: eval "$(hni init bash)"
        fish: hni init fish | source
        pwsh: Invoke-Expression (& hni init powershell)

      Nushell:

        hni init nushell | save --force ~/.config/nushell/hni.nu
        source ~/.config/nushell/hni.nu
    EOS
  end

  test do
    assert_match "hni", shell_output("#{bin}/hni --version")
    assert_match "usage", shell_output("#{bin}/hni --help").downcase
  end
end
