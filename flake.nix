{
	inputs = {
		# testing, https://github.com/NixOS/nixpkgs/issues/260278
		nixpkgs.url = "github:nixos/nixpkgs/";
		flake-utils.url = "github:numtide/flake-utils";
	};
	outputs = { self, nixpkgs, flake-utils }:
		flake-utils.lib.eachDefaultSystem (system: 
			let
				pkgs = nixpkgs.legacyPackages.${system};
			in {
				devShell = pkgs.mkShell {
					buildInputs = with pkgs; [
						dart
						flutter
					];
					CHROME_EXECUTABLE = "google-chrome-stable";
				};
			}
		);
}