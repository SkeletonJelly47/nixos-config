{ self, inputs, ... }:
{
  flake.nixosModules.transcribe = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.musescore
      pkgs.muse-sounds-manager
    ];
  };
}