module Mainboard
    class CPU
        attr_accessor :pc, :sp, :a, :x, :y, :flags, :memory, :bus, :instructions, :return_stack, :stack

        def initialize
            @pc = 0
            @sp = 0
            @a = 0
            @x = 0
            @y = 0
            @flags = 0
            @memory = []
            @bus = nil
            @instructions = {}
            @return_stack = []
            @stack = []
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
            @bus = nil
            @return_stack = []
            @stack = []
        end

        def run
            while true
                instruction = @memory[@pc]
                data = @memory[@pc + 1]
                process_instruction(instruction, data)
            end
        end

        def process_instruction(instruction, data)
            throw "Unknown op: #{instruction}"  if !instructions.has_key?(instruction)
            @instructions[instruction].call(data)
            @pc += 2
        end

        ins :nop do |data| end
        ins :jmp do |data| 
            @pc = data 
        end
        ins :jsr do |data|
            @return_stack.push(@pc)
            @pc = data 
        end
    end
end

