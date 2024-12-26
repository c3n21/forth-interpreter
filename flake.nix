{
  description = "A Nix-flake-based Java development environment";

  inputs.nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1.*.tar.gz";
  inputs.flake-parts = {
    url = "github:hercules-ci/flake-parts";
    inputs.nixpkgs-lib.follows = "nixpkgs";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    flake-parts,
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin"];

      perSystem = {
        system,
        pkgs,
        ...
      }: {
        devShells.default = pkgs.mkShell {
          name = "java-dev-shell";
          buildInputs = with pkgs; [
            jdk17
            gradle_8
            gitflow
          ];

          shellHook = ''
            echo "Welcome to the Java development environment using system ${system}!"
          '';
        };

        # Optionally define a package for the project
        # packages.default = pkgs.stdenv.mkDerivation {
        #   name = "nodejs-project";
        #   src = ./.;
        #
        #   buildInputs = with pkgs; [nodejs-18_x];
        #
        #   installPhase = ''
        #     mkdir -p $out
        #     cp -r * $out
        #   '';
        # };
      };
    };
}
