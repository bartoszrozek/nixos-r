{ pkgs }:

pkgs.R.overrideAttrs (old: rec {
  pname = "R";
  version = "4.4.2";

  src = pkgs.fetchurl {
    url = "https://cran.r-project.org/src/base/R-4/R-4.4.2.tar.xz";
    sha256 = "sha256-ERXvBAdG08idFO9Tuv1mtVgk8p5U+4NM1JL5s9bcf14=";
  };

  # Remove the conflicting CVE patch
  patches = builtins.filter
    (p: !(pkgs.lib.hasInfix "CVE-2024-27322" (toString p)))
    old.patches;
})
