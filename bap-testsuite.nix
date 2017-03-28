{ stdenv, bap, dejagnu, fetchFromGitHub }:

stdenv.mkDerivation {
  name = "bap-testsuite";
  src = fetchFromGitHub {
    owner = "BinaryAnalysisPlatform";
    repo = "bap-testsuite";
    rev = "3d1b97c759fa20d1e62383e39adeaf74839f1b0c";
    sha256 = "1iilg9accxfsdzf08j01hkd2fv3hg03npqclnhp3rfjif8jb1l2f";
  };
  buildInputs = [ bap dejagnu ];
  BAP_LOG_DIR = "logs";
  XDG_CACHE_HOME = "cache";
  # Patch out tests that manipulates the installed API path.
  # These cannot work right because this path is in the store
  # As this feature is already deprecated and rarely used, I'm
  # just disabling the tests rather than patching them to work

  # Patch hardcoded logfile to point where we actually put it
  patchPhase = ''
    rm bap.tests/api-options.exp
    sed -i site.exp -e s%~/.local/state/bap/log%$BAP_LOG_DIR/log%g
  '';
  buildPhase = ''
    make check
  '';
  installPhase = "
    mkdir -p $out
    cp bap.log bap.sum mc.log mc.sum $out
  ";
}
