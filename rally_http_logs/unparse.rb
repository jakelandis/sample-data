require "json"
require "time"

def self.getValue(data,key)
  data[key].nil? ? "-" : data[key].to_s
end

threads = 4
running = 0
Dir.glob(File.join(ARGV[0], "*.json")).select do |file|
  File.open(file.gsub('json', 'unparsed.json'), 'w') do |json_file|
    while running >= threads
      sleep 1
    end
    running = running + 1
    Thread.new do
      i = 0;
      File.open(file).each do |line|
        begin
          i += 1;
          print "." if i % 10000 == 0
          data = JSON.parse(line)
          logline = getValue(data,'clientip')  + " - - [" + Time.at(data['@timestamp'].to_i).iso8601 + "] \\\"" + getValue(data,'request') + "\\\" " + getValue(data,'status') + " " + getValue(data,'size')
          json_log_line = "{\"message\" : \"" + logline + "\"}\n"        
          json_file.write(json_log_line)
        rescue => e
          puts e
        end
      end
      running = running - 1
    end
    while running > 0
      sleep 1
    end
  end
end

