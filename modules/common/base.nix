{ config, pkgs, ... }:

{
  imports = [];

  # Включаем Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Временная зона и локаль
  time.timeZone = "Asia/Yekaterinburg";

  i18n.defaultLocale = "en_US.UTF-8";

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
    useXkbConfig = true;  # чтобы X11/XKB обрабатывал клавиатуру
  };

  # Раскладка клавиатуры
  services.xserver = {
    layout = "us,ru";
    xkbOptions = "grp:ctrl_shift_toggle,caps:escape";
  };

  # Сеть (если на всех хостах DHCP)
  networking.networkmanager.enable = true;

  # Пользователь
  users.users.gusev = {
    isNormalUser = true;
    description = "Андрей Гусев";
    extraGroups = [ "wheel" "networkmanager" "video" "audio" ];
    shell = pkgs.fish;
  };

  # Sudo с паролем (по умолчанию)
  security.sudo.enable = true;

  # SSH
  services.openssh.enable = true;

  # Звук через PulseAudio
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Шрифты
  fonts.packages = with pkgs; [
    fira-code-nerdfont
    jetbrains-mono
  ];

  # Полезные пакеты
  environment.systemPackages = with pkgs; [
    git
    curl
    man
    htop
    unzip
    pciutils
    usbutils
    neofetch
    lsof
    file
    which
    wget
  ];

  # Включаем man-страницы
  documentation.man.enable = true;
  documentation.info.enable = true;

  networking.firewall.enable = false;
}
