--[[
Minetest Mod Market - A Mod adding a market (based on commoditymarket)
]]

local market_def = {
	description = "Market",
	long_description = "Market",
	currency = {
		["default:gold_ingot"] = 1000,
		["commoditymarket:gold_coins"] = 1
	},
	currency_symbol = "$",
	inventory_limit = 100000,
	sell_limit = 100000,
	initial_items = {"default:cobble", "default:wood"},
	allow_item = function(item) return true end,
	anonymous = false,
}

local market_name = "Market"

commoditymarket.register_market(market_name, market_def)

minetest.register_chatcommand("market", {
	description = "Togle market",
	privs = {interact = true},
    func = function(name, param)
		local player_name = minetest.get_player_by_name(name)
		local msg = "Ouverture du market..."
		if player_name then
			minetest.chat_send_player(name, msg)
			commoditymarket.show_market("Market", name)
		end
	end,
})
