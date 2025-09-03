{
  add_newline = false;

  character = {
    error_symbol = "[\\$](bold red)";
    success_symbol = "[\\$](bold white)";
  };

  directory = {
    fish_style_pwd_dir_length = 3;
    read_only = "  ";
    truncate_to_repo = false;
    truncation_length = 1;
  };

  direnv = {
    disabled = false;
    format = "and [$symbol$loaded]($style)";
    loaded_msg = "󰈖 ";
    unloaded_msg = "󰮘 ";
  };

  git_metrics = {
    disabled = false;
  };

  nix_shell = {
    format = "via [$state$symbol]($style) ";
    symbol = " 󱄅 ";
  };

  status = {
    disabled = false;
    format = "[$common_meaning $status]($style) ";
  };
}
