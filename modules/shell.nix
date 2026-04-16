{ self, inputs, ... }:
{
  flake.nixosModules.shellAlias = {
    environment.shellAliases =
    {
      nrb = "sudo nixos-rebuild switch --flake .#mikko5 && nvd diff $(ls -d1v /nix/var/nix/profiles/system-*-link|tail -n 2)";
    };
  };
}