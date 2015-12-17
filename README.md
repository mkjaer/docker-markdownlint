# MarkdownLint docker container

A tool to check markdown files and flag style issues.

Based on [Markdownlint](https://github.com/mivok/markdownlint)

## Build

```docker build --tag=markdownlint .```

## Usage

To test all files in the current directory write:

```docker run -v ${PWD}:/inputfiles markdownlint```

Returns 0 if all md files are fine.

Outputs errors and returns 1 if there are issues with the MD files.
