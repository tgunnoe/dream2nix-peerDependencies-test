{
  inputs.dream2nix.url = "github:nix-community/dream2nix";
  inputs.src.url = "github:tgunnoe/dream2nix-peerDependencies-test";
  inputs.src.flake = false;
  outputs = { self, dream2nix, src }@inputs:
    let
      dream2nix = inputs.dream2nix.lib.init {
        systems = [ "x86_64-linux" ];
        config.projectRoot = ./. ;
      };
    in dream2nix.makeFlakeOutputs {
      source = src;
    };
}
