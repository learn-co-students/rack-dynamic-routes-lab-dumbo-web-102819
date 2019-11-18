class Application

	def call(env)
		resp = Rack::Response.new
		req = Rack::Request.new(env)

		if req.path.match("/items/")
			#TODO: Code for getting the items
			item_name = req.path.split("/items/").last

			# item_exist = false

			# @@items.find do |item|
			# 	if item.name == item_name
			# 		resp.write item.price
			# 		item_exist = true
			# 	end
			# end

			# if (!item_exist)
			# 	resp.write "Item not found"
   #    			resp.status = 400
   #    		end

      		if item =@@items.find{|i| i.name == item_name}
		        resp.write item.price
		    else 
		        resp.status = 400
		        resp.write "Item not found"
      		end
		else
			#error 404 here
			resp.write "Route not found"
      		resp.status = 404
		end 

		resp.finish
	end	
end