{inputs, ...}: {
  flake-file.inputs.nh.url = "github:nix-community/nh";
  den.default.nixos = {host, ...}: {
    environment.systemPackages = [inputs.nh.packages.${host.system}.default];
  };
}
