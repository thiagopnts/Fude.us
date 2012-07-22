uri = URI.parse(ENV["REDISTOGO_URL"])
REDIS = Redis::Namespace.new("short-it", :redis => Redis.new(:host => uri.host, :port => uri.port))
