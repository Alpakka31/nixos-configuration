{ config, pkgs, lib, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-22.05.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.patrik = {
    home.packages = with pkgs; [
      btop
      microsoft-edge
      git
      pfetch
      neofetch
      unrar
      unzip
      zip
      vscode
      neovim

      # Either use clang or gcc
      clang_14
      #gcc12

      p7zip
      scummvm
      gimp
      kdenlive
      brasero
      teams
      vbam
      spotify
      onedrive
      ppsspp
      gzdoom
      discord
      lutris
      minigalaxy
      wineWowPackages.staging
      gnome.gnome-tweaks
      gnomeExtensions.dash-to-panel
    ];
    
    programs = {
      git = {
        enable = true;
        userEmail = "patukka31@gmail.com";
        userName = "Alpakka31";
      };

      zsh = {
        enable = true;
        enableAutosuggestions = true;
        enableSyntaxHighlighting = true;
        history.size = 10000;

        oh-my-zsh = {
          enable = true;
          plugins = [ "git" ];
          theme = "robbyrussell";
        };

        initExtra = ''
          neofetch
        '';
      };
    };
  };

  programs = {
    steam = {
      enable = true;
    };
    gamemode.enable = true;
  };

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-original"
    "steam-runtime"
  ];
}
