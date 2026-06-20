{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    yeetmouse = {
      url = "github:AndyFilter/YeetMouse?dir=nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";

    wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";

    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake
  {
    inherit inputs;
  }
  (inputs.import-tree ./modules);

  # outputs = {
  #   self,
  #   nixpkgs,
  #   nixpkgs-unstable,
  #   home-manager,
  #   yeetmouse,
  #   ...
  # } @ inputs: let
  #   inherit (self) outputs;
  #   lib = nixpkgs.lib;
  #   system = "x86_64-linux";
  # in {
  #   nixosConfigurations.nixos = lib.nixosSystem {
  #     inherit system;
  #     specialArgs = {inherit inputs outputs;};
  #     modules = [
  #       {
  #         nixpkgs.overlays = [
  #           (final: prev: {
  #             unstable = import nixpkgs-unstable {
  #               inherit prev;
  #               system = prev.system;
  #               config.allowUnfree = true;
  #             };
  #           })
  #         ];
  #       }
  #       ./configuration.nix

  #       yeetmouse.nixosModules.default

  #       home-manager.nixosModules.home-manager
  #       {
  #         home-manager.useGlobalPkgs = true;
  #         home-manager.useUserPackages = true;

  #         home-manager.users.mikko5 = import ./home.nix;
  #       }
  #     ];
  #   };
  # };
}
