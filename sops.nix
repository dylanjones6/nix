# inspo: https://saylesss88.github.io/installation/enc/sops-nix.html?search=
{...}: {
  sops = {
    defaultSopsFile = secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/dilly/.config/sops/age/keys.txt";
    age.generateKey = true;
    secrets."openssh/github-t480" = {};
    secrets."hostId" = {};
  };
}
