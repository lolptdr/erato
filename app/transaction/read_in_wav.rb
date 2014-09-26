require 'wavefile'
include WaveFile # To avoid prefixing classes with 'WaveFile::'

class ReadInWav
  SAMPLES_PER_BUFFER = 4096

  def self.run(sound)
    Reader.new(sound.file.file).each_buffer(SAMPLES_PER_BUFFER) do |buffer|
      puts "Read #{buffer.samples.length} samples."
    end
  end

  def self.run_manually(sound)
    reader = Reader.new(sound.file.file)
    begin
      while true do
        buffer = reader.read(SAMPLES_PER_BUFFER)
        puts "Read #{buffer.samples.length} samples."
      end
    rescue EOFError
      reader.close
    end
  end

  def self.format(sound)
    # Samples will be read as monophonic floating point,
    # regardless of the actual sample format on disk
    format = Format.new(:mono, :float, 44100)
    reader = Reader.new(sound.file.file, format).each_buffer(SAMPLES_PER_BUFFER) do |buffer|
      puts "Read #{buffer.samples.length} samples."
    end
  end

  def self.meta(sound)
    info = Reader.info(sound.file.file)
    puts "  Audio Format:        #{info.audio_format}"
    puts "  Channels:            #{info.channels}"
    puts "  Bits per sample:     #{info.bits_per_sample}"
    puts "  Samples per second:  #{info.sample_rate}"
    puts "  Bytes per second:    #{info.byte_rate}"
    puts "  Block align:         #{info.block_align}"
    puts "  Sample frame count:  #{info.sample_frame_count}"

    duration = info.duration
    formatted_duration = duration.hours.to_s.rjust(2, "0") << ":" <<
                         duration.minutes.to_s.rjust(2, "0") << ":" <<
                         duration.seconds.to_s.rjust(2, "0") << ":" <<
                         duration.milliseconds.to_s.rjust(3, "0")
    puts "  Play time:           #{formatted_duration}"
  end

  def self.append(files)
    Writer.new("append.wav", Format.new(:stereo, :pcm_16, 44100)) do |writer|
      FILES_TO_APPEND.each do |file_name|
        Reader.new(file_name).each_buffer(SAMPLES_PER_BUFFER) do |buffer|
          writer.write(buffer)
        end
      end
    end
  end
end