class Xnecview < Formula
  desc "A program for visualizing NEC2 antenna simulation input and output data"
  homepage "https://www.pa3fwm.nl/software/xnecview/"
  url "https://www.pa3fwm.nl/software/xnecview/xnecview-1.37.tgz"
  sha256 "4e2cefa5887260845a09d44edab5ff9799d5d091857cf8af0a9a590cf35951f0"
  license "GPL-2.0"

  depends_on "gtk+"
  depends_on "libpng"

  def install
    system "make"
    bin.install "xnecview"
    man1.install "xnecview.1x"
  end

  test do
    system "xnecview"
  end
end
