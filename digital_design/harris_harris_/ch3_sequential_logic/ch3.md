# Chapter 3 - Sequential Logic Design

### Question 3.1

Draw a state machine that can detect when it has received the
serial input sequence 01010.

### Question 3.2

Design a serial (one bit at a time) two's complementer FSM with
two inputs, `Start` and `A`,
and one output, `Q`.
A binary number of arbitrary length is provided to input `A`,
starting with the least significant bit.
The corresponding bit of the output appears at `Q` on the same
cycle.
`Start` is asserted for one cycle to initialize the FSM before
the least significant bit is provided.

### Question 3.3

What is the difference between a latch and a flip-flop?
Under what circumstances is each one preferable?

**A:** A latch is always transparent to its input so long as its
enable signal is high.
A flip-flop is edge-triggered,
typically synchronized to the positive edge of the clock.
Flip-flops are the default in synchronous design because they make 
timing analysis simple: data moves once per clock edge
Latches are preferred when you need small area and low power.

### Question 3.4

Design a 5-bit counter finite state machine.

### Question 3.5

Design an edge detector circuit.
The output should go HIGH for one cycle after the input makes a
0 → 1 transition.

### Question 3.6

Describe the concept of pipelining and why it is used.

**A:** Pipelining breaks down processes into several steps to
increase throughput.
It trades-off cycle count (latency) for throughput and clock speed.
Most if not all modern processors implement pipelining to achieve
greater performance.

### Question 3.7

Describe what it means for a flip-flop to have a negative hold
time.

**A:** The data is allowed to change before the clock edge and the
output will still capture the correct value.
This typically occurs when the clock path inside the flip-flop is
slower than the data path.

### Question 3.9

Consider a block of logic between two registers.
Explain the timing constraints.
If you add a buffer on the clock input of the receiver (the
second flip-flop),
does the setup time constraint get better or worse?

**A:** The setup time constraint gets better as the positive edge
of the clock reaches the receiver more slowly.
Accordingly, the setup time is delayed,
meaning that the input can reach the receiver later.

Setup:  Tcq + Tpd,max + Tsetup + Tskew <= Tc

Hold:   Tcq + Tpd,min >= Thold + Tskew