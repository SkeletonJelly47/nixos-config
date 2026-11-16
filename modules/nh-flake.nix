{inputs, ...}: {
  flake-file.inputs.nh.url = "github:nix-community/nh";
  den.default.nixos = {host, ...}: {
    environment = {
      systemPackages = [inputs.nh.packages.${host.system}.default];

      # Remove once upgraded to 26.11: https://github.com/nix-community/nh/issues/874
      variables.NH_NO_SYSTEMD_RUN = 1;
    };
  };
}
