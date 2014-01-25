require 'formula'

class Vips < Formula
  homepage 'http://www.vips.ecs.soton.ac.uk/'
  url 'http://www.vips.ecs.soton.ac.uk/supported/7.38/vips-7.38.1.tar.gz'
  sha1 'd81538b0bc848f2c8b3180ec931b4dd96eefd42a'

  option 'without-check', 'Disable build time checks (not recommended)'

  depends_on 'pkg-config' => :build
  depends_on :fontconfig
  depends_on 'gettext'
  depends_on 'glib'
  depends_on :libpng => :optional
  depends_on 'jpeg' => :optional
  depends_on 'orc' => :optional
  depends_on 'openslide' => :optional
  depends_on 'libtiff' => :optional
  depends_on 'imagemagick' => :optional
  depends_on 'fftw' => :optional
  depends_on 'little-cms' => :optional
  depends_on 'pango' => :optional
  depends_on 'libexif' => :optional
  depends_on 'openexr' => :optional
  depends_on 'cfitsio' => :optional
  depends_on 'webp' => :optional

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system 'make', 'check' if build.with? 'check'
    system 'make', 'install'
  end
end
