require "sinatra"

get '/*' do
  out = []
  out << ENV['HEROKU_RELEASE_VERSION']
  out << ENV['HEROKU_RELEASE_CREATED_AT']

  # created in .profile
  File.open('process_started_at', 'r') do |f|
    while line = f.gets
      out << line
    end
  end

  out = out.join("\r")

  puts out
  return out
end
