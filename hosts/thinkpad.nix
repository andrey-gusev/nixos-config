{ config, pkgs, ... }:

{
  imports = [
    ../modules/common/base.nix
    ../modules/window-managers/dwm.nix
  ];

  networking.hostName = "thinkpad";

  # Для Intel GPU — обычно достаточно этого
  services.xserver.videoDrivers = [ "modesetting" ];

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
}
