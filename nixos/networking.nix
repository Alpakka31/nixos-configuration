{ config, ... }:
{
  # Set system hostname
  networking.hostName = "ydin";

  # Use NetworkManager
  networking.networkmanager.enable = true;

  # Use wpa_supplicant for wireless networking
  # networking.wireless.enable = true;

  services = {
    avahi = {
      enable = true;
      nssmdns = true;
      publish = {
        enable = true;
        addresses = true;
        userServices = true;
      };
    };
  };
}
