local HttpService = game:GetService("HttpService")
local ScriptContext = game:GetService("ScriptContext")
local Breadcrumbs = require(script.Breadcrumbs)

local SentryLuau = {}
local Config = {
	webhookUrl = "",
	env = "Production"
}

function SentryLuau.init(options)
	Config.webhookUrl = options.webhookUrl
	Config.env = options.env or "Production"

	ScriptContext.Error:Connect(function(message, stack, scriptInst)
		local payload = {
			event_type = "roblox_error",
			client_payload = {
				error = message,
				stack = stack,
				script_path = scriptInst:GetFullName(),
				breadcrumbs = Breadcrumbs.get(),
				env = Config.env
			}
		}
		
		pcall(function()
			HttpService:PostAsync(Config.webhookUrl, HttpService:JSONEncode(payload))
		end)
	end)
end

function SentryLuau.addBreadcrumb(msg)
	Breadcrumbs.add(msg)
end

return SentryLuau
