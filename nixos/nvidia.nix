{ config, pkgs, ... }:
{
  services.xserver.videoDrivers = [ "nvidia" ];
  boot.initrd.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia-uvm" "nvidia_drm" ];
  boot.blacklistedKernelModules = [ "nouveau" ];
  hardware.opengl.enable = true;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  hardware.nvidia.powerManagement.enable = true;
  hardware.nvidia.powerManagement.finegrained = true;
  hardware.nvidia.nvidiaSettings = false;

  services.xserver.screenSection = ''
    Option         "metamodes" "nvidia-auto-select +0+0 {ForceFullCompositionPipeline=On}"
    Option         "AllowIndirectGLXProtocol" "off"
    Option         "TripleBuffer" "on"
  '';
}
