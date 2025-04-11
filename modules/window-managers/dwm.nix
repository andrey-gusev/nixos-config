{ config, pkgs, lib, ... }:

let
  # Собираем dwm с твоим config.h
  dwmCustom = pkgs.stdenv.mkDerivation {
    pname = "dwm-custom";
    version = "6.4";

    # Здесь можно указать путь к своему форку или оставить официальный
    src = pkgs.fetchFromGitHub {
      owner = "LukeSmithxyz"; # или "user"
      repo = "dwm";
      rev = "master"; # или конкретный коммит/тег
      sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="; # пока плейсхолдер
    };

    # Копируем свой config.h
    postUnpack = ''
      cp ${./config.h} source/config.h
    '';

    buildInputs = with pkgs; [ libX11 libXft libXinerama ];

    installPhase = ''
      mkdir -p $out/bin
      make PREFIX=$out install
    '';

    meta = with lib; {
      description = "Dynamic Window Manager (custom build)";
      license = licenses.mit;
      platforms = platforms.linux;
    };
  };
in
{
  services.xserver.enable = true;

  services.xserver.windowManager.dwm = {
    enable = true;
    package = dwmCustom;
  };

  services.xserver.displayManager.lightdm.enable = false;

  environment.systemPackages = with pkgs; [
    dmenu
    xterm
    # любые дополнительные тулзы
  ];
}
