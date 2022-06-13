{ config, ... }:
{
  # Enable touchpad support for laptop
  services.xserver.libinput.enable = true;
  services.xserver.libinput.touchpad.naturalScrolling = false;
  services.xserver.libinput.touchpad.disableWhileTyping = true;

  # Power management
  services.auto-cpufreq.enable = true;
}
