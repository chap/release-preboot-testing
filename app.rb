require "sinatra"

get '/*' do
  out = []
  out << ENV['HEROKU_RELEASE_VERSION']
  out << ENV['HEROKU_RELEASE_CREATED_AT']
  process_started = Time.now.to_s

  # created in .profile
  File.open('process_started_at', 'r') do |f|
    while line = f.gets
      out << line
    end
  end

  puts out
  return out
end
