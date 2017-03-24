{nixpkgs ? import <nixpkgs-bap> {}}:

{
  bap = nixpkgs.ocamlPackages_4_02.bap;
  libbap = nixpkgs.libbap;
}
