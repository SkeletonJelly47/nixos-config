{ self, inputs, ... }:
{
  flake.nixosConfigurations.mikko5 = inputs.nixpkgs.lib.nixosSystem {
    modules =  with self.nixosModules; [
      mikkone5
      locale
      shellAlias
      yeetmouse
      fail2ban

      plasma6
      bluetooth
      audio

      games
      music
      podcast

      tex
    ];
  };
}