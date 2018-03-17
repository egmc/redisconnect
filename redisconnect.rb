require 'redis'

TIMES = 100
CONCURRENCY  = 100

TIMES.times do |i|
  begin
    threads = []
    CONCURRENCY.times do |j|
      threads << Thread.new do
        redis = Redis.new(host: "localhost", port: 6379)
        redis.ping
      end
    end
    threads.each do |t|
      t.join
    end
  rescue
    p $!  # => "unhandled exception"
  end
end
