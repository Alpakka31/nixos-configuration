{ config, pkgs, ... }:
{
  # Define users here

  # Define my user account
  users.users.patrik = {
    isNormalUser = true;
    description = "Patrik";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "lp" "scanner" ];
    shell = pkgs.zsh;
  };
}
