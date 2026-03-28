{

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri-nix = {
      url = "git+https://codeberg.org/BANanaD3V/niri-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    goose-shell = {
      url = "git+https://codeberg.org/DynamicGoose/goose-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    {
      self,
      nixpkgs,
      ...
    }@inputs:
    let
      lib = import ./lib {
        inherit self inputs;
      };
    in
    {
      nixosConfigurations = lib.genHosts {
         t-800 = {
          username = "jerem";
          userDescription = "Jerem";
        };

      };

      # Development shells in ./shells
      devShells = lib.eachSystem (
        system:
        let
          pkgs = lib.pkgsFor.${system};
        in
        import ./shells { inherit pkgs; }
      );

      # Easily run as VM with `nix run`
      apps = lib.eachSystem (system: rec {
        default = t-800;
        t-800 = lib.mkVMApp "t-800";
        # generate option documentation using https://github.com/Thunderbottom/nix-options-doc
        gen-docs = {
          type = "app";
          program = "${lib.pkgsFor.${system}.writeShellScript "gen-docs"
            "nix run github:Thunderbottom/nix-options-doc -- -p ${self} -o options.md"
          }";
        };
      });
      # Library functions for external use
      lib = lib;
    };
}
