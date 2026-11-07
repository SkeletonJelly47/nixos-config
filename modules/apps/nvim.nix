{
  den,
  inputs,
  ...
}: {
  flake-file.inputs = {
    nvim-flake.url = "github:SkeletonJelly47/nvim-flake";
  };

  #todo: rename aspect
  den.aspects.my-nvim = {host, ...}: {
    os.environment.systemPackages = [inputs.nvim-flake.packages."${host.system}".default];
  };
}
