local togedemaru = {
    name = "togedemaru",
    config = { extra = { mult = 5 } },
    rarity = 3,
    cost = 7,
    stage = "Basic",
    ptype = "Lightning",
    gen = 7,
    blueprint_compat = true,
    eternal_compat = true,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
        info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
        return {vars = {card.ability.extra.mult}}
    end,
    calculate = function(self, card, context)
        if context.check_enhancement then
            if context.other_card.config.center.key == "m_gold" then
                return { m_steel = true }
            end
            if context.other_card.config.center.key == "m_steel" then
                return { m_gold = true }
            end
        end
        if context.joker_main then
            local count = #find_pokemon_type("Lightning")
            return{mult = card.ability.extra.mult * count}
        end
    end
}
pokermon.add_family { "togedemaru" }
return { list = { togedemaru } }
