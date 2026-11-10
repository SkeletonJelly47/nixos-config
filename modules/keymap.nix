{den, ...}: {
  den.default.nixos = {
    services.xserver.xkb = {
      layout = "fi";
      variant = "nodeadkeys";
    };

    console.keyMap = "fi";
  };
}
