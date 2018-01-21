class Application
  @@items = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      resp.write find_item_by_name(item_name).price
    else
      resp.status
    resp.finish
  end

  def find_item_by_name(name)
    @@items.each do |item|
      if item.name == name
        found = item
      end
    end
    found
  end
end
