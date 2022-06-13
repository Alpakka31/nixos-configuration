{ config, pkgs, ... }:
{
  security.pam.loginLimits = [
    {
      domain = "*";
      type = "hard";
      item = "memlock";
      value = "2147483648";
    }
    {
      domain = "*";
      type = "soft";
      item = "memlock";
      value = "2147483648";
    }
  ];
}
