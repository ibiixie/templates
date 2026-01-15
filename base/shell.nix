{
  pkgs,
}:

pkgs.mkShell {
  buildInputs = with pkgs; [
    # Nix
    nil
    nixfmt
  ];
}
