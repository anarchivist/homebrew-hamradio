class Xastir < Formula
  desc "X amateur station tracking and information reporting"
  homepage "http://www.xastir.org/"
  url "https://github.com/Xastir/Xastir/archive/Release-2.1.6.tar.gz"
  sha256 "5a71af2936d4d237c779b1c3a519211f8e3cd03b9873a260c849ddc8950e1a3e"
  head "https://github.com/Xastir/Xastir.git"

  depends_on "proj"
  depends_on "pcre"
  depends_on "berkeley-db"
  depends_on "gdal"
  depends_on "libgeotiff"
  depends_on "openmotif"
  depends_on "jasper"
  depends_on "graphicsmagick"
  depends_on "autoconf" => :build
  depends_on "automake" => :build

  def install
    system "./bootstrap.sh" if build.head?
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/xastir", "-q"
  end
end
