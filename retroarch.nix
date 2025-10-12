{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    (retroarch.withCores (cores:
      with cores; [
        snes9x
      ]))
  ];
}
