{ self, inputs, ... }: {
  flake.nixosConfigurations.mikko5 = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.mikko5Configuration

      inputs.yeetmouse.nixosModules.default

      #self.nixosModules.minecraft
      #self.nixosModules.obs-studio
      #self.nixosModules.shellAlias
      #self.nixosModules.tablet
      #self.nixosModules.transcribe

      #self.homeModules.ghostty
    ];
  };
}