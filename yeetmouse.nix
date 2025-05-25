# { config, pkgs, inputs, ... }:

# {
#   # Add this to your flake inputs
#   # Note that `inputs.nixpkgs` assumes that you have an input called
#   # `nixpkgs` and you might need to change it based on your `nixpkgs`
#   # input's name.
#   inputs.yeetmouse = {
#     url = "github:AndyFilter/YeetMouse?dir=nix";
#     inputs.nixpkgs.follows = "nixpkgs";
#   };
#   # <rest of your config> ...

#   outputs = { nixpkgs, yeetmouse, ... }: {
#     # This is an example of a NixOS system configuration
#     nixosConfigurations.HOSTNAME = nixpkgs.lib.nixosSystem {
#       system = "x86_64-linux";
#       modules = [
#         # Add the `yeetmouse` input's NixOS Module to your system's modules:
#         yeetmouse.nixosModules.default
#       ];
#     };
#  };
# }