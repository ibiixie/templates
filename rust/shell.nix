{
  pkgs,
}:

pkgs.mkShell {
  buildInputs = with pkgs; [
    # Nix
    nil
    nixfmt

    # Rust
    cargo
    rust-analyzer
    rustfmt
    clippy
    rustc
  ];
}
