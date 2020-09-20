class Direwolf < Formula
  desc "Software modem and TNC for AX.25"
  homepage "https://github.com/wb2osz/direwolf"
  # I'm not attempting to build from the 1.5 tarball since the dev branch is
  # so much smoother
  # url "https://github.com/wb2osz/direwolf/archive/1.5.tar.gz"
  # sha256 "2e263ea4fa75c342b620dee048436ac95486ea3f93599ad818e74dfd4aec8b48"
  # version "1.5"
  head "https://github.com/wb2osz/direwolf.git", :branch => "dev"
  option "with-initial-config", "Do initial configuration step, i.e. 'make install-conf'. Do for the first install only."

  depends_on "hamlib"
  depends_on "portaudio"
  depends_on "gpsd" => :optional
  depends_on "cmake" => :build

  def install
    args = std_cmake_args
    mkdir "build"
    cd "build"
    system "cmake", "..", *args
    system "make", "-j4"
    system "make", "install"

    if build.with? "initial-config"
      system "make", "install-conf"
    end
  end
end
