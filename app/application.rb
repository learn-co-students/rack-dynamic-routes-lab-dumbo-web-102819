# Instructions
# Your application should only accept the /items/<ITEM NAME> route. Everything else should 404
# If a user requests /items/<Item Name> it should return the price of that item
# IF a user requests an item that you don't have, then return a 400 and an error message

class Application

  #@@items = []

  def call (env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_search = req.path.split("/items/").last

      # found_item = @@items.find{|item| item.name == item_search}

      if @@items.find{|item| item.name == item_search}
        found_item = @@items.find{|item| item.name == item_search}
        # resp.write "#{item_search} costs #{found_item.price}."
        resp.write "#{found_item.price}"

      else
        resp.write "Item not found"
        resp.status = 400
      end

    else
      resp.status = 404
      resp.write "Route not found"
    end

    resp.finish
  end
end
