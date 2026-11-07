{den, ...}: {
  den.aspects.bluetooth.nixos = {
    hardware = {
      bluetooth.enable = true;
    };

    services.blueman.enable = true;
  };

  den.aspects.kone.includes = [den.aspects.bluetooth];
}
