# frozen_string_literal: true

require_relative 'disk'
require_relative 'console'
require_relative 'device_bus'

module Mainboard
  # Bootstraps computer
  class BIOS
    attr_accessor :disk, :console
    def initialize
      @disk = Devices::Disk.new
      @console = Devices::Console.new
      DeviceBus.register_device @disk
      DeviceBus.register_device @console
    end
  end
end
