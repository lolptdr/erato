require 'wavefile'
include WaveFile


class WriteWav
  SAMPLES_PER_BUFFER = 4096
  
  def self.run(input)
    # Write a 440Hz square wave beep
    cycle = ([0.5] * 50) + ([-0.5] * 50)

    
    buffer = Buffer.new(input, Format.new(:mono, :float, 44100))
    Writer.new("my_file.wav", Format.new(:mono, :pcm_16, 44100)) do |writer|
      100.times { writer.write(buffer) }
    end
  end

  def self.append(*sounds)
    OUTPUT_FORMAT = Format.new(:stereo, :pcm_16, 44100)
    FILES_TO_APPEND = *sounds # This will be an array

    Writer.new("appended_files.wav", OUTPUT_FORMAT) do |writer|
      FILES_TO_APPEND.each do |file_name|
        Reader.new(file_name).each_buffer(SAMPLE_FRAMES_PER_BUFFER) do |buffer|
          writer.write(buffer)
        end
      end
    end

  end

  def self.run_manually
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