{nixpkgs ? import <nixpkgs-bap> {}}:

rec {
  bap = nixpkgs.ocamlPackages.bap;
  bap_4_03 = nixpkgs.ocamlPackages_4_03.bap;
  bap_python = nixpkgs.pythonPackages.bap;
  libbap = nixpkgs.libbap;
  bap_testsuite = nixpkgs.callPackage ./bap-testsuite.nix { inherit bap; };
  bap_testsuite_4_03 = nixpkgs.callPackage ./bap-testsuite.nix { bap = bap_4_03; };
}
