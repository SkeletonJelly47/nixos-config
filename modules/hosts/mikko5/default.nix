{ self, inputs, ... }:
{
  flake.nixosConfigurations.mikko5 = inputs.nixpkgs.lib.nixosSystem {
    modules =  with self.nixosModules; [
      mikkone5
      user
      locale
      shellAlias
      yeetmouse
      fail2ban

      plasma6
      bluetooth
      audio

      games
      archipelago
      music
      podcast

      tex
      paint
      videoedit
      _3dprinting
    ];
  };
}