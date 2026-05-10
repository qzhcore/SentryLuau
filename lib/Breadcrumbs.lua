local Breadcrumbs = {}
local MAX_BREADCRUMBS = 15
local history = {}

function Breadcrumbs.add(message: string)
	table.insert(history, {
		timestamp = os.time(),
		message = message
	})
	if #history > MAX_BREADCRUMBS then
		table.remove(history, 1)
	end
end

function Breadcrumbs.get()
	return history
end

return Breadcrumbs
