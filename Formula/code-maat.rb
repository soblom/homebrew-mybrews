class CodeMaat < Formula
  desc "A toolset to mine and analyze version control data"
  homepage "https://github.com/adamtornhill/code-maat"
  url "https://github.com/adamtornhill/code-maat/archive/master.zip"
  version "1.0-SNAPSHOT"
  sha256 "6091a81c6256b6133a56278505a4d6defdb784d93c47adb5d3521a06cca82b06"

  depends_on "leinigen" => :build

  def install
    system "lein uberjar"

    libexec.install "target/code-maat-#{version}-standalone.jar"
    bin.write_jar_script libexec/"code-maat-#{version}-standalone.jar", codemaat
  end

  test do
    output = `#{bin}/code-maat -h`
    assert_match "Version: #{version}", output
  end
end
