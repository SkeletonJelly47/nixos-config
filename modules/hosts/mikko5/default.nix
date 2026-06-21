{ self, inputs, ... }:
{
  flake.nixosConfigurations.mikko5 = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.mikkone5
      self.nixosModules.shellAlias
    ];
  };
}