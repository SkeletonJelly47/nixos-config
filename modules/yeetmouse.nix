{
  den,
  inputs,
  ...
}: {
  flake-file.inputs = {
    yeetmouse = {
      #url = "github:AndyFilter/YeetMouse?dir=nix"; # Original repo
      #url = "github:SkeletonJelly47/YeetMouse/99ce851cdbce82ee09dca8dcd10c408ec3fcd7c1?dir=nix"; # commit before removal
      url = "github:SkeletonJelly47/YeetMouse/26311fcaf3b7db1e35ddd2721171b90b13f33f9a?dir=nix"; # commit after removal
      # url = "path:/home/mikko5/repo/YeetMouse/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.aspects.yeetmouse = {
    nixos = {
      imports = [inputs.yeetmouse.nixosModules.default];

      hardware.yeetmouse = {
        enable = true;
        # sensitivity = 0.3613;
        sensitivity = {
          x = 0.3613;
          ratioYX = 1.4;
        };

        mode.classic = {
          acceleration = 0.033;
          exponent = 3.36;
          useSmoothing = false;
        };
      };
    };
  };
}
