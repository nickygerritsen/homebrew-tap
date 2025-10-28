class Switchboard < Formula
  desc "Smart URL router that opens links in different browsers"
  homepage "https://github.com/nickygerritsen/switchboard"
  url "https://github.com/nickygerritsen/switchboard/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "9b1b0db0faba292faea3af4658fcad09aa33a3aab2d18cbb9a4323e8f05bc07d"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/switchboard"
  end

  def caveats
    <<~EOS
      To register Switchboard as a browser:
        switchboard register

      Then set it as your default browser in System Settings.
    EOS
  end

  test do
    system "#{bin}/switchboard", "--version"
  end
end
