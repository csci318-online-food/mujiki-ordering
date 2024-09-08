# Mujiki (無食)

A monorepo for all Mujiki codebases. Each codebase is included as a `git submodule`.

## Instructions

### Cloning

Make sure you pass the `--recursive` flag when cloning this repo to include all submodules.

```sh
git clone --recursive https://github.com/csci318-online-food/mujiki-ordering
```

### Running

Use the `run.sh` script, which recursively runs each submodule:

```sh
./run.sh
```

Currently, root access is required for binding into ports in the 8x range.
