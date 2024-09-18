{
  description = "CLI Tools to open, extract and mount AccessData AD1 images on linux";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
  };

  outputs = { self, nixpkgs }:
    let
      forEachSystem = nixpkgs.lib.genAttrs [ "aarch64-linux" "x86_64-linux" ];
    in
    {
      apps = forEachSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        ad1-tools = pkgs.callPackage ./ad1-tools.nix {};
      in
      {
        default = self.apps.${system}.ad1extract;

        ad1info = {
          type = "app";
          program = "${ad1-tools}/bin/ad1info";
        };

        ad1verify = {
          type = "app";
          program = "${ad1-tools}/bin/ad1verify";
        };

        ad1extract = {
          type = "app";
          program = "${ad1-tools}/bin/ad1extract";
        };

        ad1mount = {
          type = "app";
          program = "${ad1-tools}/bin/ad1mount";
        };

        ad1decrypt = {
          type = "app";
          program = "${ad1-tools}/bin/ad1decrypt";
        };
      });
    };
} 
