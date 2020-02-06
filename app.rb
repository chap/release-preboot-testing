require "sinatra"

get '/*' do
  out = []
  # created in .profile
  File.open('process_started_at', 'r') do |f|
    while line = f.gets
      out << line
    end
  end
  out << "Release Version: #{ENV['HEROKU_RELEASE_VERSION']}"
  out << "Release Created: #{ENV['HEROKU_RELEASE_CREATED_AT']}"
  out << "Dyno ID: #{ENV['HEROKU_DYNO_ID']}"

  out = out.join("\r\n\r\n")

  puts out
  return out
end

