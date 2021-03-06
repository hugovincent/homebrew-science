require 'formula'

class PicardTools < Formula
  homepage 'http://picard.sourceforge.net/'
  url "https://downloads.sourceforge.net/project/picard/picard-tools/1.118/picard-tools-1.118.zip"
  sha1 '66327cb64d3fba2cd095e6411facad3be6de34b2'

  def install
    (share/'java').install Dir['*.jar', "picard-tools-#{version}/*.jar"]
  end

  def caveats
    <<-EOS.undent
      The Java JAR files are installed to
          #{HOMEBREW_PREFIX}/share/java
    EOS
  end

  test do
    system "java -jar #{share}/java/ViewSam.jar --version"
  end
end
