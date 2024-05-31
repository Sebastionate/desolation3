
ix.currency.symbol = ""
ix.currency.singular = "token"
ix.currency.plural = "tokens"

ix.config.SetDefault("scoreboardRecognition", true)
ix.config.SetDefault("music", "music/hl2_song19.mp3")

ix.config.Add("rationInterval", 300, "How long a person needs to wait in seconds to get their next ration", nil, {
	data = {min = 0, max = 86400},
	category = "economy"
})
ix.config.Add("rationIntervalMPF", 300, "How long MPF need to wait in seconds to get their next ration.", nil, {
	data = {min = 0, max = 5000},
	category = "economy"
})
