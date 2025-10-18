class Switchboard < Formula
  desc "Smart URL router that opens links in different browsers"
  homepage "https://github.com/nickygerritsen/switchboard"
  url "https://github.com/nickygerritsen/switchboard/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "857427757e63689cfd244510a7768498aac68a6d7add39ba35ac7de9a6aaa49b"
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
