# Instruction set

## Math

- add X Y -> A: X + Y
- sub X Y -> A: X - Y
- mul X Y -> A: X \* Y
- div X Y -> A: X / Y
- mod X Y -> A: X % Y

## Logic

- and X Y -> A: X & Y
- or X Y -> A: X | Y
- notx X -> X: !X 
- noty Y -> Y: !Y
- nota Z -> Z: !Z
- eor X Y -> A: X ^ Y
- eq X Y -> EQF: X == Y
- neq X Y -> EQF: X != Y
- lt X Y -> EQF: X < Y
- gt X Y -> EQF: X > Y

## Device

- deo -> DeviceBus.output(id: Stack.Pop, data: Stack.Pop)
- din -> Stack.Push(data), Stack.Push(id)

## Registers

- lda ADDR -> A: @ADDR
- ldx ADDR -> X: @ADDR
- ldy ADDR -> Y: @ADDR 
- sta A ADDR -> @ADDR: A 
- stx X ADDR -> @ADDR: X 
- sty Y ADDR -> @ADDR: Y

## Transfer

- tax A -> X: A 
- tay A -> Y: A 
- txa X -> A: X 
- tya Y -> A: Y
- sxy X Y -> X:Y, Y:X

## Memory

- mov ADDR1 ADDR2 -> @ADDR2: @ADDR1 
- cmov EQF ADDR1 ADDR2 -> EQF? @ADDR2: @ADDR1 

## Stack

- psha - push to stack from accumulator
- pshx - push to stack from x
- pshy - push to stack from y
- popa - pop from stack to accumulator
- popx - pop from stack to x
- popy - pop from stack to register
- tspx - transfer stack pointer to x
- tspy - transfer stack pointer to y

## Jump

- jmp
- jcn
- ret

## Increment, Decrement

- inca
- incx
- incy
- deca
- decx
- decy

## Shift

Shifts accumulator.

- shl
- shr
- rtr
- rtl

## Misc

- nop
- halt
