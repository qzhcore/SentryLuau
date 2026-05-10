local Sentry = require(game.ReplicatedStorage.Packages.SentryLuau)

Sentry.init({
	webhookUrl = "https://api.github.com/repos/qzhcore/SentryLuau/dispatches",
	env = "Testing"
})

Sentry.addBreadcrumb("Player joined the test server")

task.wait(5)
Sentry.addBreadcrumb("Simulating a crash...")

-- will trigger the AI Agent!
local fakeTable = nil
print(fakeTable.Something)
