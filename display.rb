# frozen_string_literal: true

require_relative 'device'
require 'shoes'

module Devices
  WIDTH = 320
  HEIGHT = 200

  # Display window device.
  class Display < Device
    # Cache of pixels.
    # @return [Array] pixels.
    attr_accessor :vid_cache

    def initialize
      super
      cls
    end

    def assign_type
      @device_type = :display
    end

    def receive_data(data)
      puts "Display received: #{data}"
    end

    # Wrtie color to pixel.
    # @param pos_x [Numeric] X screen position.
    # @param pos_y [Numeric] Y screen position.
    # @param color [Color] Pixel color.
    def write_pixel(pos_x, pos_y, color)
      puts "Display: write_pixel(#{pos_x}, #{pos_y}, #{color})"
    end

    # Clear screen.
    def cls
      puts 'Display: cls()'
      @vid_cache = 0..(WIDTH * HEIGHT)
    end
  end
end
