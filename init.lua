regen_max               = 1.0    -- 恢复到多少为止 (百分比)


is_max_hp_set=false

-- 设置血量上限为 5000 = 200*25
function setup_max_hp()
	if not is_max_hp_set then
		local is_set=false
		for i,player in ipairs(EntityGetWithTag("player_unit")) do
			local stats=EntityGetComponent(player,"DamageModelComponent")[1]
			
			ComponentSetValue(stats,"max_hp",200)
			ComponentSetValue(stats,"hp",200)
			is_set=true

		end
		is_max_hp_set= is_set		
	end
end


is_setup_money_called=false


-- 设置金钱 1,000,000
function setup_money()
	if not is_setup_money_called then

		local is_set = false 

		for i,player in ipairs(EntityGetWithTag("player_unit")) do

			local wallet=EntityGetFirstComponent(player,"WalletComponent")
			local money=ComponentGetValue2(wallet,"money")
			ComponentSetValue(wallet,"money",1000000)

			is_set=true
		end
		is_setup_money_called=is_set
	end
end

function OnWorldPreUpdate()
	setup_max_hp()

	setup_money()
	
end
