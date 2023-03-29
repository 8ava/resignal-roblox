
local function insert(y, z)
	local index = #y; y[index] = z; return index
end


local module = {}

function module.new()
	local obj = 
		{
			connections = {};
		}

	function obj.fire(...)
		for _, a in obj.connections do
			a(...)
		end
	end

	function obj.connect(z)
		local obj2 = {}

		do
			obj2.index = insert(obj.connections, z)
		end

		function obj2.disconnect()
			table.remove(obj.connections, obj2.index)
		end

		return obj2
	end

	return obj
end


return module
