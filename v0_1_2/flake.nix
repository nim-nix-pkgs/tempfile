{
  description = ''Temporary files and directories'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-tempfile-v0_1_2.flake = false;
  inputs.src-tempfile-v0_1_2.owner = "OpenSystemsLab";
  inputs.src-tempfile-v0_1_2.ref   = "refs/tags/v0.1.2";
  inputs.src-tempfile-v0_1_2.repo  = "tempfile.nim";
  inputs.src-tempfile-v0_1_2.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-tempfile-v0_1_2"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-tempfile-v0_1_2";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}