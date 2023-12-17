{
  description = "A very basic flake";

   inputs = {
    # Specify the source of Home Manager and Nixpkgs.

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
   
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    hyprland-contrib = {
    url = "github:hyprwm/contrib";
    inputs.nixpkgs.follows = "nixpkgs";
  };

    anyrun.url = "github:Kirottu/anyrun";
    anyrun.inputs.nixpkgs.follows = "nixpkgs";

    hy3 = {
      url = "github:outfoxxed/hy3";
      inputs.hyprland.follows = "hyprland";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";


       nix-super.url = "github:privatevoid-net/nix-super/ba035e1ea339a97e6ba6a1dd79e0c0e334240234";
      schizofox.url = "github:schizofox/schizofox";


      armcord-hm = { 
       url = "github:n3oney/armcord-hm";
       inputs.nixpkgs.follows = "nixpkgs";
      };

    
      #EWW like app
    ags.url ="github:Aylur/ags";
    
      };
  

  outputs = inputs@{ nixpkgs, home-manager,nixos-hardware, ... }:{
 nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        system = "x86_64-linux";
                    
        modules = [
          ./configuration.nix
          nixos-hardware.nixosModules.dell-inspiron-14-5420
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.dennkaii = import ./home.nix ;
            home-manager.extraSpecialArgs = { inherit inputs; };           
        }
      ];
     };
    }; 
   };
}
  
