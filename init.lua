--[[
Minetest Mod Market - A Mod adding a market (based on commoditymarket)

Copyright (C) 2017-2020 AFCM <afcm.contact@gmail.com>

MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
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
    func = function(name, param)
		local player_name = minetest.get_player_by_name(name)
		local msg = "Ouverture du market..."
		if player_name then
			minetest.chat_send_player(name, msg)
			commoditymarket.show_market("Market", name)
		end
	end,
})
