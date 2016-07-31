module LightsHelper
  include PiPiper

  PINS = [17, 18, 22].map { |pin| PiPiper::Pin.new(:pin => pin, :direction => :out) }

  def playing_lights
    lights()
  end

  def success_lights
    lights([1])
  end

  def fail_lights
    lights([2], 10)
  end

  private

  def lights(pins_to_show=[0, 1, 2], loop=5)
    pins_to_show = pins_to_show.map { |p| PINS[p] }
    i            = 0
    while i < loop do
      pins_to_show.each { |p| p.on and sleep 0.15 }
      pins_to_show.each { |p| p.off and sleep 0.15 }
      i=i+1
    end
  end
end

