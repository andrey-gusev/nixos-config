{ config, pkgs, ... }:

{
  imports = [
    ../modules/common/base.nix
    ../modules/window-managers/hyprland.nix
  ];

  networking.hostName = "desktop";

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    open = false; # Проприетарный драйвер
    nvidiaSettings = true;
  };

  # Дополнительно можно указать настройки монитора или Wayland
}
