require "json"
threads = 4
running = 0
Dir.glob(File.join(ARGV[0], "*.out")).select do |file|
  File.open(file + ".json", 'w') do |json_file|
    while running >= threads
      sleep 1
    end
    running = running + 1
    Thread.new do
      File.open(file).each do |line|
        begin
          utf_8_logline = line.encode('UTF-8')
          logline = utf_8_logline.gsub(/^[0-9]*/, "127.0.0.1").gsub(/\n$/, "")
          json_log_line = JSON.generate({"message" => logline})
          #puts json_log_line
          json_file.write(json_log_line + "\n")
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