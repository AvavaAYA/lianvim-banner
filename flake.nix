{
  description = "lianvim banner based on nyancat";
  inputs = { nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; };
  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      defaultPackage.${system} = with pkgs;
        stdenv.mkDerivation rec {
          name = "lianvim-banner";
          version = "1.0";
          src = ./src;

          installPhase = ''
            mkdir -p $out/bin
            cp nyancat $out/bin/$name
          '';
        };
    };
}
