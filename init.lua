--Add a market command

local S = minetest.get_translator(minetest.get_current_modname())

commoditymarket.register_market("Market", {
	description = S("Market"),
	long_description = S("Global Market"),
	currency = {
		["default:gold_ingot"] = 1000,
		["commoditymarket:gold_coins"] = 1
	},
	currency_symbol = "$",
	inventory_limit = minetest.settings:get("global_market.max_items_player") or 200,
	sell_limit = minetest.settings:get("global_market.max_items_player") or 200,
	initial_items = {"default:cobble", "default:wood"},
	allow_item = function(item) return true end,
	anonymous = false,
})

minetest.register_chatcommand("market", {
	description = S("Togle market"),
	privs = {interact = true},
    func = function(name, param)
		local player = minetest.get_player_by_name(name)
		if player then
			minetest.chat_send_player(name, S("Opening of the global market..."))
			commoditymarket.show_market("Market", name)
		end
	end,
})
