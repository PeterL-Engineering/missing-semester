# Lecture 4 Exercises — Debugging and Profiling

### General-Purpose Debuggers
- `gdb` is the de facto standaed debugger for C, C++, Rust, and 
other compiled languages
- Here are some useful GDB commands
  - `run` - Start the program
  - `b {function}` or `b {file}:{line}` - Set a breakpoint
  - `c` - Continue execution
  - `step` / `next` / `finish` - Step in / step over / step out
  - `p {variable}` - Print value of variable
  - `bt` - Show backtrace (call stack)
  - `watch {expression}` - Break when the value changes

### Record-Replay Debugging
- `rr` is a powerful Linux tool that reords program execution and 
allows deterministic replay with full debugging capabilities
- You can record and replay a program with `rr record ./my_program` 
and `rr replay` respectively
- Here are some useful RR commands
  - `reverse-continue` (`rc`) - Run backwards until hitting a 
  breakpoint
  - `reverse-step` (`rs`) - Step backwards, one line
  - `reverse-next` (`rn`) - Step backwards, skipping function calls
  - `reverse-finish` (`rf`) - Run backwards until entering the 
  current function

### System Call Tracing
- `strace` lets you observe every system call a program makes
- Here are some useful `strace` commands
  - `strace ./my_program` - Trace all system calls
  - `strace -e trace=file ./my_program` - Trace only file-related 
  calls
  - `strace -f ./my_program` - Follow child processes
  - `strace -p <PID>` - Trace a running process
  - `strace -T ./my_program` - Show timing information

### Time Profiling
- The wall clock can be misleading since your computer might be 
running other processes at the same time or waiting for events to happen
- `time` distinguishes between real, user, and sys time
  - **Real** - Wall clock time from start to finish,
  including time spent waiting
  - **User** - Time spent in the CPU running user code
  - **Sys** - Time spent in the CPU running kernel code

### Resource Profiling


### CPU Profilers