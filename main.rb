# frozen_string_literal: true

require_relative 'cpu'
require_relative 'bios'
require_relative 'parser'

VCPU = CPU.new
VParser = Parser.new

compiled = VParser.parse("
nop
halt
")

VCPU.load_memory(compiled)

VCPU.run
