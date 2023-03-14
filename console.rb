# frozen_string_literal: true

require_relative 'device'

module Devices
  # Handles printing to console.
  class Console < Device
    def receive_data(data)
      write data
    end

    def write(text)
      puts "#{text}\n"
    end
  end
end
