require 'wavefile'
include WaveFile

SAMPLES_PER_BUFFER = 4096

class WriteWav
  def self.run(sound)
    # Write a 440Hz square wave beep
    cycle = ([0.5] * 50) + ([-0.5] * 50)
    buffer = Buffer.new(cycle, Format.new(:mono, :float, 44100))
    Writer.new("my_file.wav", Format.new(:mono, :pcm_16, 44100)) do |writer|
      100.times { writer.write(buffer) }
    end
  end

  def self.run_manually(sound)
    writer = Writer.new("my_file.wav", Format.new(:mono, :pcm_16, 44100))

    # Write a 440Hz square wave beep
    cycle = ([0.5] * 50) + ([-0.5] * 50)
    buffer = Buffer.new(cycle, Format.new(:mono, :float, 44100))
    100.times do
      writer.write(buffer)
    end

    writer.close
  end

  def self.format(sound)
    Writer.new("copy.wav", Format.new(:stereo, :pcm_16, 44100) do |writer|
      Reader.new("original.wav").each_buffer(SAMPLES_PER_BUFFER) do |buffer|
        writer.write(buffer)
      end
    end
  end
end