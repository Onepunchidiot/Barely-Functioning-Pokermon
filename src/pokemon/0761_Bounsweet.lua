local bounsweet = {
    name = "bounsweet",
    config = { extra = { rounds = 4, mult = 3 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    rarity = 1,
    cost = 4,
    stage = "Basic",
    ptype = "Grass",
    gen = 7,
    blueprint_compat = true,
    eternal_compat = true,
    calculate = function(self, card, context)
        if context.joker_main then
            local count = #find_pokemon_type("Grass")
            return { mult = card.ability.extra.mult * count }
        end
    end
}
local steenee = {
    name = "steenee",
    config = { extra = { rounds = 4, mult = 7 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    rarity = 2,
    cost = 6,
    stage = "One",
    ptype = "Grass",
    gen = 7,
    blueprint_compat = true,
    eternal_compat = true,
    calculate = function(self, card, context)
        if context.joker_main then
            local count = #find_pokemon_type("Grass")
            return { mult = card.ability.extra.mult * count }
        end
    end
}
local tsareena = {
    name = "tsareena",
    config = { extra = { rounds = 4, mult = 11 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    rarity = "poke_safari",
    cost = 10,
    stage = "Two",
    ptype = "Grass",
    gen = 7,
    blueprint_compat = true,
    eternal_compat = true,
    calculate = function(self, card, context)
        if context.joker_main then
            local count = #find_pokemon_type("Grass")
            return { mult = card.ability.extra.mult * count }
        end
        if context.setting_blind and not card.getting_sliced then
            if #find_pokemon_type("Grass") == #G.jokers.cards then
                if not context.blueprint and context.blind.boss and not card.getting_sliced then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    G.GAME.blind:disable()
                                    play_sound('timpani')
                                    delay(0.4)
                                    return true
                                end
                            }))
                            card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('ph_boss_disabled') })
                            return true
                        end
                    }))
                end
            end
        end
    end
}
pokermon.add_family { "bounsweet", "steenee", "tsareena" }
return { list = { bounsweet, steenee, tsareena } }
