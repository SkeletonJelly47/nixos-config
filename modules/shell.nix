{den, ...}: {
  den.aspects.shell-alias.nixos = {host, ...}: {
    environment.shellAliases = {
      nrb = "sudo nixos-rebuild switch --flake .#${host.name} && nvd diff $(ls -d1v /nix/var/nix/profiles/system-*-link|tail -n 2)";
      nrt = "sudo nixos-rebuild test --flake .#${host.name}";
      cdc = "cd /home/mikko5/nixos-config";
      sperf = "sudo cpupower frequency-set -g performance";
    };
  };
}
