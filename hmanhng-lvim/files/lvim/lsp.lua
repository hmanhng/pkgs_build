-- generic LSP settings
lvim.lsp.templates_dir = join_paths(get_runtime_dir(), "after", "ftplugin")
require("lvim.lsp.manager").setup("csharp_ls")
