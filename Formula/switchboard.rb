class Switchboard < Formula
  desc "Smart URL router that opens links in different browsers"
  homepage "https://github.com/nickygerritsen/switchboard"
  url "https://github.com/nickygerritsen/switchboard/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "fdb8bcc7b4cf2d9462f487fb8ee625ea48c89cf3c4397c48af239356f7ecd89e"
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
