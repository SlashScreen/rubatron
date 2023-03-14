require_relative "device"
require "shoes"

module Mainboard
    WIDTH = 320
    HEIGHT = 200

    class Display < Device
        attr_accessor :vid_cache
        def receive_data(data)
            puts "Display received: #{data}"
        end

        def write_pixel(x, y, color)
            puts "Display: write_pixel(#{x}, #{y}, #{color})"
        end

        def cls()
            puts "Display: cls()"
            vid_cache = 0..(WIDTH * HEIGHT)
        end
    end
end
