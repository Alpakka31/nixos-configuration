{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      # Include custom modules
      ./users.nix
      ./home-manager.nix
      ./syspkgs.nix
      ./bluetooth.nix
      ./sound.nix
      ./xorg.nix
      ./desktop.nix
      ./networking.nix
      ./printing.nix
      ./fonts.nix
      ./other.nix

      # GPUs
      ./amdgpu.nix
      #./nvidia.nix

      # Laptop
      ./laptop.nix
    ];

  # Bootloader and kernel
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
      timeout = 5;
    };
  };

  # Set your time zone.
  time.timeZone = "Europe/Helsinki";

  # Select internationalisation properties.
  i18n.defaultLocale = "fi_FI.utf8";

  # Configure console keymap
  console.keyMap = "fi";

  # Allow unfree software
  nixpkgs.config.allowUnfree = true;

  # Setup Nix Package manager settings
  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # Automatically upgrade packages when rebuilding
  system.autoUpgrade = {
    enable = true;
    channel = "https://nixos.org/channels/nixos-22.05";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leavecatenate(variables, "bootdev", bootdev)
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}
