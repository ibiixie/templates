{
  description = "Templates for various programming languages and technologies";

  outputs =
    { self }:
    {
      templates = {
        base = {
          path = ./base;
          description = "Generic base template, a template for templates";
        };

        rust = {
          path = ./rust;
          description = "Template for Rust";
        };
      };
    };
}
