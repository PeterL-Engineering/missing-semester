# Lecture 4 — Debugging and Profiling

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
- **General Monitoring:** `htop` is an improved version of `top`
that presents various statistics for running processes
- **I/O Operations:** `iotop` displays live I/O usage information
- **Memory Usage:** `free` displays total free and used memory
- **Open Files:** `lsof` lists file information about files opened 
by processes. 
Useful for checking which process has opened a specific file.
- **Network Connections:** `ss` lets you monitor network 
connections. 
A common use case is figuring out what process is using a given port: 
`ss - tlnp | grep :8080`
- **Network Usage:** `nethogs` and `iftop` are good interactive CLI
tools for monitoring network usage per process

### CPU Profilers
- `perf` is the standard Linux profiler
  - `perf stat` gives you a quick overview of where time is spent
  - Flame graphs are a visualization that makes profiling data easier to understand
  - To generate a flame graph from `perf` data run the following commands

``` bash
# Record profile
perf record -g ./my_program

# Generate famge graph (requries flamegraph scripts)
perf script | stackcollaps-perf.pl | flamegraph.pl > flamgegraph.svg
```
- `callgrind` is a profiling tool that records the call history and
instruction counts of your program
  - Callgrind is slower than sampling profilers (eg., `perf`) but
  provides precise call counts and can simulate cache behaviour
- `massif` profiles heap memory usage
  - It helps show heap usage over time,
  helping identify memory leaks and excessive allocation
