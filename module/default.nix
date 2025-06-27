{ ... }:
let
  cwd = builtins.readDir ./.;
  dirs = builtins.filter (name: cwd.${name} == "directory") (builtins.attrNames cwd);
  path = dir: ./. + "/${dir}";
in
{
  imports = map path dirs;
}
