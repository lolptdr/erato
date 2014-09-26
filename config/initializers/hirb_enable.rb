if defined?(Hirb) && Rails.env.development?
  Hirb.enable({:width => 155, :height => 500})
end