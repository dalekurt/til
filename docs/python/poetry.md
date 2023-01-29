# Poetry Cheatsheet

## Basic usage

### New Project

```shell
poetry new <project name> --name app
```

### Existing project

```shell
poetry init
```

### Add dependency

```shell
poetry add <package name>
```

### Activate environment

This creates a subshell, so when you exit the subshell no changes are persisted.

```shell
poetry shell
```