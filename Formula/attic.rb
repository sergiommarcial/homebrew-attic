class Attic < Formula
  desc "Offline disk explorer for macOS: where the space went and what to clean"
  homepage "https://github.com/sergiommarcial/attic"
  url "https://github.com/sergiommarcial/attic/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "449c45e3fce45be84146022b00f9cb2d83bf0fcc020018179da79e985d9d5e32"
  license "MIT"

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/attic")
  end

  service do
    run [opt_bin/"attic", "daemon"]
    keep_alive successful_exit: false
    throttle_interval 300
    process_type :background
    nice 10
    log_path var/"log/attic.log"
    error_log_path var/"log/attic.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/attic --version")
    assert_match "No scan yet", shell_output("#{bin}/attic status")
  end
end
