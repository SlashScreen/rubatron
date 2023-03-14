require_relative "device"

module Mainboard
    class Console < Device
        def receive_data(data)
            write data
        end

        def write(text)
            puts text + "\n"
        end
    end
end
