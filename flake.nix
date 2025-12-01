{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-25.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    yeetmouse = {
      url = "github:AndyFilter/YeetMouse?dir=nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    yeetmouse,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib;
    system = "x86_64-linux";
  in {
    nixosConfigurations.nixos = lib.nixosSystem {
      inherit system;
      specialArgs = {inherit inputs outputs;};
      modules = [
        {
          nixpkgs.overlays = [
            (final: prev: {
              unstable = import nixpkgs-unstable {
                inherit prev;
                system = prev.system;
                config.allowUnfree = true;
              };
            })
          ];
        }
        ./configuration.nix

        yeetmouse.nixosModules.default

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.mikko5 = import ./home.nix;
        }
      ];
    };
  };
}
