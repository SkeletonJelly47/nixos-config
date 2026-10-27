{
  den,
  inputs,
  ...
}: {
  flake-file.inputs = {
    nvim-flake.url = "github:SkeletonJelly47/nvim-flake";
  };

  den.aspects.my-nvim = {host, ...}: {
    os.environment.systemPackages = [inputs.nvim-flake.packages."${host.system}".default];
  };

  den.schema.user.includes = [den.aspects.my-nvim];
}
