require_relative 'wav_chunks'
require_relative 'wav_interpret'
# require 'pry-byebug'

NOTES = %w(a ais b c cis d dis e f fis g gis)
FREQUENCIES = {
  d4:-7, dis4:-6, e4:-5, f4:-4, fis4:-3,
  g4:-2, gis4:-1, a4:0, ais4:1, b4:2,
  c5:3, cis5:4, d5:5
}

# get the frequency of the pitch
def frequency_of(step)
  440.0*(2**(step.to_f/12.0))
end

sample_rate = 44100.0 # 44100 Hz
duration = 1 # 1 second
stream = [] # data stream for left and right channels
frequency = frequency_of(FREQUENCIES[:a4])

# for duration of 1s, step every 1/44100 times and write the value
(0.0..duration.to_f).step(1/sample_rate) do |i|
  x = (10000 * Math.sin(2 * Math::PI * frequency * i)).to_i
  y = (10000 * Math.cos(2 * Math::PI * frequency * i)).to_i
  stream << [x, y]
end

def harmonics(input)
  Math.sin(2 * Math::PI * input) +
    Math.sin(2 * Math::PI * input * 2)
end

(0.0..duration.to_f).step(1/sample_rate) do |i|
  x = (10000 * harmonics(frequency * i)).to_i
  stream << [x, x]
end

# wav_file = Wav.new('harmonics.wav')
# wav_file.write(stream)
# wav_file.close

def envelope(input, duration)
  Math.cos((Math::PI * input)/(2 * duration.to_f))
end

(0.0..duration.to_f).step(1/sample_rate) do |i|
  x = (10000 * Math.sin(2 * Math::PI * frequency * i) *
    envelope(i, duration)).to_i
  stream << [x, x]
end

wav_file = Wav.new('newwave.wav')
wav_file.write(stream)
wav_file.close