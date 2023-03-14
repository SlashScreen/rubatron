# frozen_string_literal: true

module Devices
  # @abstract A Device is anything that connects to the CPU that isn't part of it.
  # 	It's like a peripheral.
  #	Override {#receive_data}, {#assign_type}, and {#initialize} to implement a device.
  class Device
    # Controls the device type. Can be `:display`, `:input`, `speaker`, `disk`, `:mouse`, `unknown`.
    # @return [Symbol] device type.
    attr_accessor :device_type
    # Device ID.
    # @return [String] id.
    attr_accessor :id

    def initialize
      assign_type
    end

    # Assign the type of this device
    def assign_type
      @device_type = :unknown
    end

    # @abstract called when the device receives data.
    def receive_data(data)
      # do something
    end
  end
end
