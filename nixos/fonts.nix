{ config, pkgs, ... }:
{
  fonts.fonts = with pkgs; [
    corefonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
  ];
}
