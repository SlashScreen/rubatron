# frozen_string_literal: true

require_relative 'device'

module Devices
  # Disk reader device. Not the file system, only reads data from disk.
  class Disk < Device
    def receive_data(data)
      # do something
    end
  end
end
