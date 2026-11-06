{den, ...}: {
  den.default.nixos = {
    services.xserver.xkb = {
      layout = "fi";
      variant = "";
    };

    console.keyMap = "fi";
  };
}
