class Switchboard < Formula
  desc "Smart URL router that opens links in different browsers"
  homepage "https://github.com/nickygerritsen/switchboard"
  url "https://github.com/nickygerritsen/switchboard/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "2f23081b272652fee2f38c8533a2efd3a540694ebb602c0c6a486e60e784790e"
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
