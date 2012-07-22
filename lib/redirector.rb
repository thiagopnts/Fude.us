class Redirector < ActionController::Metal
  def self.call(env)
    if env["PATH_INFO"] =~ /^\/([A-Z]{4})$/
      url = $redis[$1]
      return [301, {"Location" => url}, ['']] if url
    end
    [404, {"Content-Type" => "text/html",
      "X-Cascade" => "pass"}, ["Not Found"]]
  end

  def index
    self.call(env)
  end

end
