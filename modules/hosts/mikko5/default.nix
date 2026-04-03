{ self, inputs, ... }: {
  flake.nixosConfigurations.mikko5 = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.mikko5Configuration

      {
        nixpkgs.overlays = [
          (final: prev: {
            unstable = import inputs.nixpkgs-unstable {
              inherit prev;
              system = prev.system;
              config.allowUnfree = true;
            };
          })
        ];
      }

      inputs.yeetmouse.nixosModules.default

      self.nixosModules.minecraft
    ];
  };
}