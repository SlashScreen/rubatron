# frozen_string_literal:true

require_relative 'device'

# Module for main components: CPU, Bios, Bus
module Mainboard
  # Handles commpunication between CPU and devices.
  class DeviceBus
    @@devices = [] # May need to replace with hashmap

    def self.device_input(device, data) end

    def self.device_output(device, data)
      @@devices
        .select { |x| x.id == device }
        .first
        .receive_data(data)
    end

    def self.get_device_id(type)
      @@devices
        .select { |d| d.device_type == type }
        .first
        .id
    end

    def self.register_device(device)
      @@devices.push(device)
    end
  end
end
