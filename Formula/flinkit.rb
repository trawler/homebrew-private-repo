require_relative "../lib/custom_download_strategy.rb"

class private-repo < Formula
    desc "Tool for automating and deployment of applications on Flink's Platform"
    homepage "https://github.com/user/private-repo"
    url "https://github.com/user/private-repo.git",
        tag:      "v0.0.1",
        revision: "82999d9795d6c86ca8242518f57f98a7e3161176",
        download_strategy: GitHubPrivateRepositoryReleaseDownloadStrategy
    license "Apache-2.0"
    head "https://github.com/user/private-repo.git", branch: "main"

    if OS.mac? && Hardware::CPU.arm?
        url "https://github.com/user/private-repo/releases/download/v0.0.1/private-repo_0.0.1_Darwin_arm64.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
        sha256 "11a5633f44b9c1222223e743a270511e410dfb563472faf6150a159d76ed7d59"
    end

    if OS.mac? && Hardware::CPU.intel?
        url "https://github.com/user/private-repo/releases/download/v0.0.1/private-repo_0.0.1_Darwin_x86_64.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
        sha256 "4d9762a6b092cd40096907b3da54d6936e090cb56ed65a3e37aa43882dcb72b3"
    end

    def install
      bin.install "private-repo"
    	generate_completions_from_executable(bin/"private-repo", "completion")
    end

    test do
      system "#{bin}/private-repo", "--help"
    end
  end
