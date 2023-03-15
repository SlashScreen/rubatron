# frozen_string_literal: true

require_relative 'device_bus'

module Mainboard
  class CPU
    attr_accessor :pc, :sp, :a, :x, :y, :flags, :memory, :bus, :instructions, :return_stack, :stack

    def initialize
      reset
    end

    def self.ins(name, &block)
      @instructions[name] = block
    end

    def reset
      @pc = 0
      @sp = 0
      @a = 0
      @x = 0
      @y = 0
      @flags = 0
      @memory = []
      @bus = DeviceBus.new
      @return_stack = []
      @stack = []
    end

    def load_memory(mem)
      @memory = mem
    end

    def run
      while true
        instruction = @memory[@pc]
        data = @memory[@pc + 1]
        process_instruction(instruction, data)
        break if get_flag :halt
      end
    end

    def process_instruction(instruction, data)
      throw "Unknown op: #{instruction}" unless instructions.has_key?(instruction)
      @instructions[instruction].call(data)
      @pc += 2
    end

    # math
    ins :add { |data| @a = @x + @y}
    ins :sub { |data| @a = @x - @y}
    ins :mul { |data| @a = @x * @y}
    ins :div { |data| @a = @x / @y}
    ins :mod { |data| @a = @x % @y}
    # bitwise
    ins :and { |data| @a = @x & @y}
    ins :or { |data| @a = @x | @y}
    ins :xor { |data| @a = @x ^ @y}
    ins :notx { |data| @x = ~@x}
    ins :noty { |data| @y = ~@y}
    ins :nota { |data| @a = ~@a}
    # comparisons
    ins :eq { |data| set_flag :equal @x == @y }
    ins :neq { |data| set_flag :equal @x != @y }
    ins :gt { |data| set_flag :equal @x > @y }
    ins :lt { |data| set_flag :equal @x < @y }
    ins :gte { |data| set_flag :equal @x >= @y }
    ins :lte { |data| set_flag :equal @x <= @y }
    # registers
    ins :lda { |data| @a = @memory[data] }
    ins :ldx { |data| @x = @memory[data] }
    ins :ldy { |data| @y = @memory[data] }
    ins :sta { |data| @memory[data] = @a }
    ins :stx { |data| @memory[data] = @x }
    ins :sty { |data| @memory[data] = @y }
    # transfer
    ins :tax { |data| @x = @a }
    ins :tay { |data| @y = @a }
    ins :txa { |data| @a = @x }
    ins :tya { |data| @a = @y }
    ins :sxy { |data| 
      local_x = @x
      local_y = @y
      @x = local_y
      @y = local_x 
    }
    # memory
    ins :mov { |data| @memory[data[1]] = @memory[data[0]] }
    ins :cmov { |data| @memory[data[1]] = @memory[data[0]] if get_flag :equal } 
    # stack
    ins :pusha { |data| push(@a) }
    ins :pushx { |data| push(@x) }
    ins :pushy { |data| push(@y) }
    ins :popa { |data| @a = pop }
    ins :popx { |data| @x = pop }
    ins :popy { |data| @y = pop }
    # increment
    ins :inca { |data| @a += 1 }
    ins :incx { |data| @x += 1 }
    ins :incy { |data| @y += 1 }
    ins :deca { |data| @a -= 1 }
    ins :decx { |data| @x -= 1 }
    ins :decy { |data| @y -= 1 }
    # device
    ins :deo { |data| @bus.device_output(data[0], data[1]) }
    # TODO: din
    # jump
    ins :jmp do |data|
      @pc = data
    end
    ins :jsr do |data|
      @return_stack.push(@pc)
      @pc = data
    end
    ins :jcn { |data| @pc = data if get_flag :equal }
    ins :rts { |data| @pc = @return_stack.pop }
    # misc
    ins :nop { |data| }
    ins :halt { |data| set_flag :halt true }
    ins :eqf { |data| get_flag :equal }
    ins :ovf { |data| get_flag :overflow }
    ins :hlt { |data| get_flag :halt }
  end

  def push(data)
    throw "Stack overflow" if @stack.length == 255
    @stack.push(data)
  end

  def pop
    throw "Stack underflow" if @stack.length == 0
    @stack.pop
  end

  # Least significant bit -> most
  # Equal
  # Overflow
  # Halt
  #
  #
  #
  #
  #
  def set_flag(flag, value)
    case flag
      where flag == :equal
        @flags | 0x01
      where flag == :overflow
        @flags | 0x02
      where flag == :halt
        @flags | 0x04
    end
  end

  def get_flag(flag)
    case flag
      where flag == :equal
        @flags & 0x01 == 0x01
      where flag == :overflow
        @flags & 0x02 == 0x02
      where flag == :halt
        @flags & 0x04 == 0x04
    end
  end
end
