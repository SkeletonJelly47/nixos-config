{den, ...}: {
  den.aspects.keymap.os = {
    services.xserver.xkb = {
      layout = "fi";
      variant = "";
    };

    console.keyMap = "fi";
  };

  den.schema.host.includes = [den.aspects.keymap];
}
