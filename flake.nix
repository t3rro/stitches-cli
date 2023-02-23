{
  description = "stitches-cli";

  inputs.nixpkgs.url = github:NixOS/nixpkgs;
  inputs.ruby-flake-utils.url = github:t3rro/ruby-flake-utils;

  outputs = { ruby-flake-utils, nixpkgs, ... }:
    ruby-flake-utils.lib.mkGemSystems
      "stitches-cli"
      nixpkgs
      ./Gemfile.lock
      ./Gemfile
      ./gemset.nix
      "bin"
  ;
}
