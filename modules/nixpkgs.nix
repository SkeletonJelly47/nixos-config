{
  den,
  inputs,
  ...
}: {
  flake-file.inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  den.aspects.unstable-overlay.os.nixpkgs.overlays = [
    (final: prev: {
      unstable = import inputs.nixpkgs-unstable {
        inherit prev;
        system = prev.system;
        config.allowUnfree = true;
      };
    })
  ];

  den.schema.host.includes = [den.aspects.unstable-overlay];
}
