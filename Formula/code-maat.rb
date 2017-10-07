# Documentation: https://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

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
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test code-maat`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    output = `bin/codemaat -h`
    assert_match "Version: #{version}", output
  end
end
