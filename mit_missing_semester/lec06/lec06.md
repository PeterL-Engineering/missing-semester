# Lecture 6 - Packaging & Shipping Code

## Dependencies & Environments
- One method of abstraction is offloading logic to other libraries
- `uv pip install <package>` installs the desired package and any of 
its own dependencies
- Using dependencies can create dependency conflicts if programs 
require incompaitble versions of the same dependency
- Each project should have its own virtual environment
    - Virtual environments isolate the dependencies of each program
    - They enable you to have different versions of your programming
    language at runtime
    - In Python we can create a virtual environment by running

```bash
$ which python
/usr/bin/python
$ pwd
/home/missingsemester
$ python -m venv venv
$ source venv/bin/activate
$ which python
/home/missingsemester/venv/bin/python
$ which pip
/home/missingsemester/venv/bin/pip
$ python -c 'import requests; print(requests.__path__)'
['/home/missingsemester/venv/lib/python3.11/site-packages/requests']
```

## Artifacts & Packaging
- Developers write and read source code,
while artifacts are the package outputs from that source code
- Packaging requires an artifact that installers like `uv pip` can
use to install the relevant files
    - In Python, we use `pyproject.toml` to list the project specifics,
    required dependencies, version of the package, and other info
    - Here's a minimal `pyproject.toml` for a library that also
    provides a CLI tool

```bash
[project]
name = "greeting"
version = "0.1.0"
description = "A simple greeting library"
dependencies = ["typer>=0.9"]

[project.scripts]
greet = "greeting:cli"

[build-system]
requires = ["setuptools>=61.0"]
build-backend = "setuptools.build_meta"
```
- We can build a *wheel* that contains all the necessary info to install
the package using `uv build`
    - This does not address platform-specific libraries such as CUDA,
    nor platforms/architectures

## Releases & Versioning
- Changes in the behaviour of a library can range from patches, 
new features that extend functionality,
to changes that breaking backwards compatibility
- The most prevalent convention to version software is Semantic
Versioning or SemVer (MAJOR.MINOR.PATCH)
    - PATCH (eg., 1.2.3 -> 1.2.4) should only contain bug fixes and 
    be fully backwards compatible
    - MINOR (eg., 1.2.3 -> 1.3.0) adds new functionality in a
    backwards-compatible way
    - MAJOR (eg., 1.2.3 -> 2.0.0) indicates breaking changes that
    may require code modifications

## Reproducibility

## VMs & Containers