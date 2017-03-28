{nixpkgs ? import <nixpkgs-bap> {}}:

rec {
  bap = nixpkgs.ocamlPackages.bap;
  bap_python = nixpkgs.pythonPackages.bap;
  libbap = nixpkgs.libbap;
  bap_testsuite = nixpkgs.callPackage ./bap-testsuite.nix { inherit bap; };
}
