{ config, pkgs, ... }:

{
  imports = [
    ../modules/common/base.nix
    ../modules/window-managers/i3.nix
  ];

  # Устанавливаем имя хоста
  networking.hostName = "hp";

  # Видеодрайверы
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Конфигурация для i3
  services.xserver.windowManager.i3.enable = true;
  services.xserver.windowManager.i3.package = pkgs.i3;

  # Дополнительно можно добавить настройки, специфичные для hp
}
