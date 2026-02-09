{ pkgs, ... }:
let
  pname = "projectplus";
  version = "3.1.5";

  srcZipped = pkgs.fetchzip {
    url = "https://github.com/Project-Plus-Development-Team/Project-Plus-Dolphin/releases/download/v${version}/Project+.v${version}.Netplay.Linux.AppImage.zip";
    hash = "sha256:05b0e6cc80b84b5693f038272238ae3a2be89d4f728ed548c950043c24aab702";
  };

  appimageContents = pkgs.appimageTools.extract {
    inherit pname version;
    src = "${srcZipped}/Project+.v${version}.Netplay.Linux.AppImage";
  };

in
pkgs.appimageTools.wrapType2 {
  inherit pname version;
  src = "${srcZipped}/Project+.v${version}.Netplay.Linux.AppImage";
  pkgs = pkgs;
  extraInstallCommands = ''
    install -m 444 -D ${appimageContents}/${pname}.desktop -t $out/share/applications
    substituteInPlace $out/share/applications/${pname}.desktop \
      --replace 'Exec=AppRun' 'Exec=${pname}'
    cp -r ${appimageContents}/usr/share/icons $out/share

    # unless linked, the binary is placed in $out/bin/cursor-someVersion
    # ln -s $out/bin/${pname}-${version} $out/bin/${pname}
  '';

  extraBwrapArgs = [
    "--bind-try /etc/nixos/ /etc/nixos/"
  ];

  # vscode likes to kill the parent so that the
  # gui application isn't attached to the terminal session
  # dieWithParent = false;

  extraPkgs = pkgs: with pkgs; [
    unzip
    autoPatchelfHook
    asar
    # override doesn't preserve splicing https://github.com/NixOS/nixpkgs/issues/132651
    (buildPackages.wrapGAppsHook3.override {inherit (buildPackages) makeWrapper;})
  ];
}