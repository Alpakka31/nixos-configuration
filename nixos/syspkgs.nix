{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    iw
    cifs-utils
    usbutils
    pciutils
    killall
  ];
}
