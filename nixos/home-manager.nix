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
      gnome.dconf-editor
      orchis-theme
      papirus-icon-theme
    ];

    dconf.settings = {
      "org/gnome/desktop/background" = {
        "picture-uri" = "/home/patrik/.wallpaper-image";
        "picture-uri-dark" = "/home/patrik/.wallpaper-image-dark";
      };
      "org/gnome/desktop/screensaver" = { 
        "picture-uri" = "/home/patrik/.wallpaper-image";
      };
      "org/gnome/desktop/interface" = {
        "color-scheme" = "prefer-dark";
      };
      "org/gnome/shell" = {
        "enabled-extensions" = [
          "user-theme@gnome-shell-extensions.gcampax.github.com"
          "dash-to-panel@jderose9.github.com"
        ];
      };
      "org/gnome/shell" = {
        "favorite-apps" = [
          "org.gnome.Settings.desktop"
          "org.gnome.Nautilus.desktop"
          "microsoft-edge.desktop"
          "org.gnome.Console.desktop"
          "org.gnome.eog.desktop"
          "org.gnome.TextEditor.desktop"
          "org.gnome.Totem.desktop"
          "org.gnome.Music.desktop"
          "discord.desktop"
          "spotify.desktop"
          "net.lutris.Lutris.desktop"
          "steam.desktop"
          "code.desktop"
        ];
      };
      "org/gnome/shell/extensions/user-theme" = {
        #"name" = "Orchis-Dark";
        "name" = "";
      };
      "org/gnome/shell/extensions/dash-to-panel" = {
        "animate-appicon-hover" = true;
        "panel-lengths" = "{\"0\":100}";
        "panel-element-positions" = "{\"0\":[{\"element\":\"showAppsButton\",\"visible\":true,\"position\":\"stackedTL\"},{\"element\":\"activitiesButton\",\"visible\":false,\"position\":\"stackedTL\"},{\"element\":\"leftBox\",\"visible\":true,\"position\":\"stackedTL\"},{\"element\":\"taskbar\",\"visible\":true,\"position\":\"stackedTL\"},{\"element\":\"centerBox\",\"visible\":true,\"position\":\"stackedBR\"},{\"element\":\"rightBox\",\"visible\":true,\"position\":\"stackedBR\"},{\"element\":\"dateMenu\",\"visible\":true,\"position\":\"stackedBR\"},{\"element\":\"systemMenu\",\"visible\":true,\"position\":\"stackedBR\"},{\"element\":\"desktopButton\",\"visible\":false,\"position\":\"stackedBR\"}]}";
      };
      "org/gnome/desktop/wm/preferences" = {
        "button-layout" = "appmenu:minimize,maximize,close";
      };

      # Laptop specific
      "org/gnome/desktop/peripherals" = {
        "natural-scroll" = false;
      };
      "org/gnome/desktop/interface" = {
        "show-battery-percentage" = true;
      };
    };
    home.file.".wallpaper-image".source = "/etc/nixos/wallpaper.jpg";
    home.file.".wallpaper-image-dark".source = "/etc/nixos/wallpaper.jpg";

    gtk = {
      enable = true;
      theme = {
        name = "Orchis-Dark";
      };
      iconTheme = {
        name = "Papirus-Dark";
      };
    };

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
    dconf = {
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
