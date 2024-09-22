{ pkgs ? import <nixpkgs> {} }: rec {
  ad1-tools = pkgs.callPackage ./ad1-tools.nix {};
}
