{ self, inputs, ... }:
{
  flake.nixosConfigurations.mikko5 = inputs.nixpkgs.lib.nixosSystem {
    modules =  with self.nixosModules; [
      mikkone5
      shellAlias
      yeetmouse
      fail2ban
      bluetooth
      audio
    ];
  };
}