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
- lte X Y -> EQF: X <= Y
- gte X Y -> EQF: X >= Y

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

- psha A -> Stack.Push(A)
- pshx X -> Stack.Push(X)
- pshy Y -> Stack.Push(Y)
- popa -> A: Stack.Pop
- popx -> X: Stack.Pop
- popy -> Y: Stack.Pop
- tspx -> X: SP
- tspy -> Y: SP
- txsp X -> SP: X
- tysp Y -> SP: Y

## Jump

- jmp ADDR -> PC: ADDR, ReturnStack.Push(PC)
- jcn EQF ADDR -> EQF? PC: ADDR, ReturnStack.Push(PC)
- ret -> PC: ReturnStack.Pop

## Increment, Decrement

- inca -> A: A + 1
- incx -> X: X + 1
- incy -> Y: Y + 1
- deca -> A: A - 1
- decx -> X: X - 1
- decy -> Y: Y - 1

## Shift

Shifts accumulator.

- shl X Y -> A: X << Y
- shr X Y -> A: X >> Y
- rtr X Y -> A: X >>> Y
- rtl X Y -> A: X <<< Y

## Misc

- nop
- halt -> Halt
