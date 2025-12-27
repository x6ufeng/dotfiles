{
  description = "NixOS configuration for x86_64 server with Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix.url = "github:Mic92/sops-nix";
  };

  outputs = {
    self,
    nixpkgs,
    sops-nix,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    username = "kyo";
    hostname = "nixos";
    specialArgs =
      inputs
      // {
        inherit username hostname system;
      };
  in {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;

    nixosConfigurations."${hostname}" = nixpkgs.lib.nixosSystem {
      inherit system specialArgs;

      modules = [
        ./modules/system
        ./modules/users
        ./modules/apps.nix
        ./modules/hardware
        ./modules/services
        ./modules/secrets

        sops-nix.nixosModules.sops

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.extraSpecialArgs = specialArgs;
          home-manager.users.${username} = import ./home;
        }
      ];
    };
  };
}
