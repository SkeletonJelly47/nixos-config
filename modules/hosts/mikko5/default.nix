{ config, self, inputs, ... }:

let
  host = {
    name = "mikko5";
    user.name = "mikko5";
    state.version = "25.05";
    system = "x86_64-linux";
  };
in
{
  flake.nixosConfigurations.mikko5 = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.mikkone5
      inputs.yeetmouse.nixosModules.default
      self.nixosModules.yeetmouse
      self.nixosModules.minecraft
      #self.nixosModules.obs-studio
      self.nixosModules.shellAlias
      self.nixosModules.tablet
      self.nixosModules.transcribe
    ];
  };

  #flake.modules.nixos.mikko5 = {
  #  inherit host;
  #  home-manager.users.${host.user.name} = {
  #    imports = with config.flake.modules.homeManager; [
  #      ghostty
  #    ];
  #  };
  #};
}