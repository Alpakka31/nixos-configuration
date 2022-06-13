{ config, ... }:
{
  # Add amdgpu kernel module to initrd
  boot.initrd.kernelModules = [ "amdgpu" ];

  # Enable Vulkan support
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;

  # Fix screen tearing on AMD GPUs under Xorg
  services.xserver.screenSection = ''
    Option      "TearFree" "true"
  '';
}
