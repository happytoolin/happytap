class Hni < Formula
  desc "ni-compatible package manager command router with node shim"
  homepage "https://github.com/happytoolin/hni"
  version "0.0.1-alpha-4"
  license "GPL-3.0"

  on_macos do
    on_arm do
      url "https://github.com/happytoolin/hni/releases/download/v#{version}/hni-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "f981419399f7199da7105e7842292ac809b84bc5e16b995d32e3daa1eecf9dee"
    end
    on_intel do
      url "https://github.com/happytoolin/hni/releases/download/v#{version}/hni-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "29aa8a045b197880ea31ff9bcfecbe2d10ba499cb19cb47325b51d2cb43b7af5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/happytoolin/hni/releases/download/v#{version}/hni-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a830c53eb36ebab2cc0ad39882becaed999076d53130e15988b6ece1160b9d00"
    end
    on_intel do
      url "https://github.com/happytoolin/hni/releases/download/v#{version}/hni-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c29b336598dd76c07ef7ec5024564387ddaf00d337a197faab9861a6fe537540"
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
