{ config, lib, pkgs, inputs, ... }:
{
  environment.variables.HOMEBREW_NO_ANALYTICS = "1";

  system.primaryUser = "dilly";

  # services.nix-daemon.enable = true;

  # nix = {
  #   package = pkgs.nix;
  #   gc.automatic = true;
  #   optimise.automatic = true;
  #   settings = {
  #     auto-optimise-store = true;

  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };

    brews = [
      "trash"
      #"docker"
    ];

    casks = [
      "docker"
      "unnaturalscrollwheels"
    ];
  };
}
