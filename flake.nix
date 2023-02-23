{
  description = "stitches-cli";

  inputs.nixpkgs.url = github:NixOS/nixpkgs;
  inputs.ruby-flake-utils.url = github:t3rro/ruby-flake-utils;

  outputs = { ruby-flake-utils, nixpkgs, ... }:
    ruby-flake-utils.lib.mkGemSystems {
      inherit nixpkgs;
      name = "stitches-cli";
      lockfile = ./Gemfile.lock;
      gemfile = ./Gemfile;
      gemset = ./gemset.nix;
      strategy = "bin";
      src = ./.;
    };
}
