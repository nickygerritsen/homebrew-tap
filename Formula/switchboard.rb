class Switchboard < Formula
  desc "Smart URL router that opens links in different browsers"
  homepage "https://github.com/nickygerritsen/switchboard"
  url "https://github.com/nickygerritsen/switchboard/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "914d28903ac182ed00bcaf64037a6aae41ea0397cf1f3a7f01935e47cf327df3"
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
