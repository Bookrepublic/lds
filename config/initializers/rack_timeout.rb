if Rails.env != "development"
  require "rack-timeout"
  Rack::Timeout.timeout = (ENV["RACK_TIMEOUT"] || 10).to_i
end
