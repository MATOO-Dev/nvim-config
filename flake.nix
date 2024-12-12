# Copyright (c) 2023 BirdeeHub
# Licensed under the MIT license
{
  description = "MATOO's personal nvim config, built with nixCats";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixCats.url = "github:BirdeeHub/nixCats-nvim";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixCats,
      ...
    }@inputs:
    let
      inherit (nixCats) utils;
      luaPath = "${./.}";
      forEachSystem = utils.eachSystem nixpkgs.lib.platforms.all;
      extra_pkg_config = {
      };
      inherit
        (forEachSystem (
          system:
          let
            dependencyOverlays = [
              (utils.standardPluginOverlay inputs)
            ];
          in
          {
            inherit dependencyOverlays;
          }
        ))
        dependencyOverlays
        ;

      categoryDefinitions =
        {
          pkgs,
          settings,
          categories,
          name,
          ...
        }@packageDef:
        {
          lspsAndRuntimeDeps = {
            general = with pkgs; [
              # C++
              clang-tools
              # CSharp
              csharp-ls
              # Java
              jdt-language-server
              # Lua
              lua-language-server
              # Markdown
              marksman
              # Nix
              nixd
              nil
              # Rust
              rust-analyzer
              # LaTeX
              texlab
              # Typst
              tinymist
              # formatters
              alejandra
              astyle
              csharpier
              gdtoolkit_4
              nixfmt-rfc-style
              rustfmt
              stylua
              tex-fmt
              typstyle
              #lint
              #debuggers
              gdb
              lldb
              netcoredbg
            ];
          };

          startupPlugins = {
            gitPlugins = with pkgs.neovimPlugins; [ ];
            general = with pkgs.vimPlugins; [
              lze
              monokai-pro-nvim
              nvim-web-devicons
              oil-nvim
              plenary-nvim
            ];
          };

          optionalPlugins = {
            gitPlugins = with pkgs.neovimPlugins; [ ];
            general = with pkgs.vimPlugins; [
              # completion
              nvim-cmp
              luasnip
              cmp_luasnip
              cmp-buffer
              cmp-path
              cmp-nvim-lsp
              cmp-nvim-lua
              cmp-nvim-lsp-signature-help
              lspkind-nvim
              friendly-snippets
              # status
              lualine-nvim
              # editing
              nvim-autopairs
              vim-move
              # lsp etc
              nvim-lspconfig
              nvim-treesitter-textobjects
              nvim-treesitter.withAllGrammars
              # navigation
              telescope-nvim
              hardtime-nvim
              nvim-ufo
              vim-tmux-navigator
              # visual fanciness
              indent-blankline-nvim
              gitsigns-nvim
              #typst
              typst-vim
              typst-preview-nvim
              typst-conceal-vim
              # extra menus
              trouble-nvim
              undotree
              # text management
              comment-nvim
              conform-nvim
              nvim-surround
              #DAP
              nvim-dap
              nvim-nio
              nvim-dap-ui
              nvim-dap-virtual-text
              #java
              nvim-jdtls
              # one-small-step-for-vimkind
            ];
          };

          sharedLibraries = {
            general = with pkgs; [
            ];
          };

          environmentVariables = {
            test = {
              CATTESTVAR = "It worked!";
            };
          };

          extraWrapperArgs = {
            test = [
              ''--set CATTESTVAR2 "It worked again!"''
            ];
          };

          extraPython3Packages = {
            test = _: [ ];
          };

          extraLuaPackages = {
            test = [ (_: [ ]) ];
          };
        };

      matoo_extra =
        { pkgs, ... }@misc:
        {
          javaExtras = {
            java-debug-adapter = pkgs.vscode-extensions.vscjava.vscode-java-debug;
          };
        };

      packageDefinitions = {
        nvim = args: {
          settings = {
            wrapRc = true;
            aliases = [ "vim" ];
          };
          categories = {
            general = true;
            gitPlugins = true;
            customPlugins = true;
            test = true;
            example = {
              youCan = "add more than just booleans";
              toThisSet = [
                "and the contents of this categories set"
                "will be accessible to your lua with"
                "nixCats('path.to.value')"
                "see :help nixCats"
              ];
            };
          };
          extra = matoo_extra args // { };
        };
      };
      defaultPackageName = "nvim";
    in
    forEachSystem (
      system:
      let
        nixCatsBuilder = utils.baseBuilder luaPath {
          inherit
            nixpkgs
            system
            dependencyOverlays
            extra_pkg_config
            ;
        } categoryDefinitions packageDefinitions;
        defaultPackage = nixCatsBuilder defaultPackageName;
        pkgs = import nixpkgs { inherit system; };
      in
      {
        packages = utils.mkAllWithDefault defaultPackage;
        devShells = {
          default = pkgs.mkShell {
            name = defaultPackageName;
            packages = [ defaultPackage ];
            inputsFrom = [ ];
            shellHook = '''';
          };
        };
      }
    )
    // {
      overlays = utils.makeOverlays luaPath {
        inherit nixpkgs dependencyOverlays extra_pkg_config;
      } categoryDefinitions packageDefinitions defaultPackageName;
      nixosModules.default = utils.mkNixosModules {
        inherit
          defaultPackageName
          dependencyOverlays
          luaPath
          categoryDefinitions
          packageDefinitions
          extra_pkg_config
          nixpkgs
          ;
      };
      homeModule = utils.mkHomeModules {
        inherit
          defaultPackageName
          dependencyOverlays
          luaPath
          categoryDefinitions
          packageDefinitions
          extra_pkg_config
          nixpkgs
          ;
      };
      inherit utils;
      inherit (utils) templates;
    };
}
