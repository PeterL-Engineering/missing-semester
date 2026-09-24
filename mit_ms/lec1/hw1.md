# Lecture 1 Exercises — Shell Fundamentals

## Setup

For this course, you need to be using a Unix shell like Bash or
ZSH. If you are on Linux or macOS, you don't have to do anything
special. If you are on Windows, you need to make sure you are
not running `cmd.exe` or PowerShell; you can use Windows
Subsystem for Linux or a Linux virtual machine to use
Unix-style command-line tools.

To make sure you're running an appropriate shell, try:

```bash
echo $SHELL
```

If it says something like `/bin/bash` or `/usr/bin/zsh`,
you're running the right program.

## Exercises

### 1. `ls -l`

What does the `-l` flag to `ls` do? Run:

```bash
ls -l /
```

and examine the output. What do the first 10 characters of
each line mean? (Hint: `man ls`)


**A:** `-l` uses a long listing format. 
There are many other flags, 
nearly one for each letter in the alphabet, 
that can be used with `ls`.

### 2. Globbing

In the command:

```bash
find ~/Downloads -type f -name "*.zip" -mtime +30
```

`*.zip` is a "glob". What is a glob? Create a test directory
with some files and experiment with patterns like:

```bash
ls *.txt
ls file?.txt
ls {a,b,c}.txt
```

See *Pattern Matching* in the Bash manual.

**A:** A glob is a pattern used to match file and directory names.
For example,
"*" matches zero or more characters so that `*.zip` finds all files
of type `.zip`.

### 3. Quoting

What's the difference between `'single quotes'`,
`"double quotes"`, and `$'ANSI quotes'`? Write a command that
echoes a string containing a literal `$`, a `!`, and a newline
character. See *Quoting*.

**A:** `single quotes` are fully literal, nothing is interpolated.
For example, the apostrophe must be rewritten as `'/''` to close
and reopen the quotation.

`"double quotes"` does interpolate characters such as the apostrophe.
However,
"$" must be written as `\$` to avoid being interpreted as an
unassigned variable, and \n is also unknown.

`$'ANSI quotes'` interpolates the newline character and $,
but requires the apostrophe to be written as `\'`.

```bash
echo -e 'Hello!\n Here'\''s a dollar sign: $'
echo "Hello\!\n Here's a dollar sign: \$"
echo $'Hello!\n Here\'s a dollar sign: $'
```

### 4. Standard streams and redirection

The shell has three standard streams: stdin (0), stdout (1),
and stderr (2). Run:

```bash
ls /nonexistent /tmp
```

and redirect stdout to one file and stderr to another. How
would you redirect both to the same file? See *Redirections*.

**A:** 

### 5. Exit status and control operators

`$?` holds the exit status of the last command (0 = success).
`&&` runs the next command only if the previous succeeded;
`||` runs it only if the previous failed. Write a one-liner
that creates `/tmp/mydir` only if it doesn't already exist.
See *Exit Status*.

### 6. Why `cd` is a builtin

Why does `cd` have to be built into the shell itself rather
than a standalone program? (Hint: think about what a child
process can and cannot affect in its parent.)

### 7. File existence check script

Write a script that takes a filename as an argument (`$1`)
and checks whether the file exists using `test -f` or
`[ -f ... ]`. It should print different messages depending on
whether the file exists. See *Bash Conditional Expressions*.

### 8. Making a script executable

Save the script from the previous exercise to a file (e.g.,
`check.sh`). Try running it with:

```bash
./check.sh somefile
```

What happens? Now run:

```bash
chmod +x check.sh
```

and try again. Why is this step necessary? (Hint: look at
`ls -l check.sh` before and after the `chmod`.)

### 9. Debugging with `set -x`

What happens if you add `-x` to the set flags in a script?
Try it with a simple script and observe the output. See
*The Set Builtin*.

### 10. Command substitution

Write a command that copies a file to a backup with today's
date in the filename (e.g., `notes.txt` →
`notes_2026-01-12.txt`). (Hint: `$(date +%Y-%m-%d)`.) See
*Command Substitution*.

### 11. Flexible test script

Modify the flaky test script from the lecture to accept the
test command as an argument instead of hardcoding
`cargo test my_test`. (Hint: `$1` or `$@`.) See
*Special Parameters*.

### 12. Pipes — file extension frequency

Use pipes to find the 5 most common file extensions in your
home directory. (Hint: combine `find`, `grep`/`sed`/`awk`,
`sort`, `uniq -c`, and `head`.)

### 13. `xargs` — line counts

`xargs` converts lines from stdin into command arguments. Use
`find` and `xargs` together (not `find -exec`) to find all
`.sh` files in a directory and count the lines in each with
`wc -l`. Bonus: make it handle filenames with spaces. (Hint:
`-print0` and `-0`.) See `man xargs`.

### 14. `curl` + `grep`

Use `curl` to fetch the HTML of the course website
(`https://missing.csail.mit.edu/`) and pipe it to `grep` to
count how many lectures are listed. (Hint: look for a pattern
that appears once per lecture; use `curl -s` to silence the
progress output.)

### 15. `jq` — JSON extraction

`jq` is a powerful tool for processing JSON data. Fetch the
sample data at
`https://microsoftedge.github.io/Demos/json-dummy-data/64KB.json`
with `curl` and use `jq` to extract just the names of people
whose version is greater than 6. (Hint: pipe to `jq .` first
to see the structure; then try:

```bash
jq '.[] | select(...) | .name'
```

)

### 16. `awk` — column filtering and swapping

`awk` can filter lines based on column values and manipulate
output. For example:

```bash
awk '$3 ~ /pattern/ {$4=""; print}'
```

prints only lines where the third column matches `pattern`,
while omitting the fourth column. Write an `awk` command that
prints only lines where the second column is greater than 100,
and swaps the first and third columns. Test with:

```bash
printf 'a 50 x\nb 150 y\nc 200 z\n'
```

### 17. SSH log pipeline

Dissect the SSH log pipeline from the lecture: what does each
step do? Then build something similar to find your most-used
shell commands from `~/.bash_history` (or `~/.zsh_history`).