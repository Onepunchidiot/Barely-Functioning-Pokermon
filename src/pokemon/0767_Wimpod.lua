local wimpod = {
    name = "wimpod",
    config = { extra = { chips = 20, rounds = 4 } },
    loc_vars = function(self, info_queue, card)
        type_tooltip(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.rounds } }
    end,
    rarity = 1,
    cost = 4,
    stage = "Basic",
    ptype = "Grass",
    gen = 7,
    blueprint_compat = true,
    eternal_compat = false,
    calculate = function(self, card, context)
        if context.joker_main then
            return { chips = card.ability.extra.chips }
        end
        if context.end_of_round and context.cardarea == G.jokers then
            card.ability.extra.rounds = math.max(card.ability.extra.rounds - 1, 0)
            return { message = localize("poke_evolve_level") }
        end
        if context.before and context.cardarea == G.jokers and G.GAME.current_round.hands_played >= 1 and not context.blueprint then
            card.ability.fainted = G.GAME.round
            card:set_debuff()
        end
    end
}
local golisopod = {
    name = "golisopod",
    config = { extra = { Xmult = 3, h_size = 1 } },
    loc_vars = function(self, info_queue, card)
        type_tooltip(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult } }
    end,
    rarity = "poke_safari",
    cost = 7,
    stage = "Basic",
    ptype = "Grass",
    gen = 7,
    blueprint_compat = true,
    eternal_compat = false,
    calculate = function(self, card, context)
        if context.joker_main then
            return { Xmult = card.ability.extra.Xmult }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and context.beat_boss then
            if  not card.ability.extra.you_failed and not card.ability.extra.raised then 
            card.ability.extra.raised = true
            G.hand:change_size(card.ability.extra.h_size)
            else card.ability.extra.you_failed = nil 
            end
        end
        if context.before and context.cardarea == G.jokers and G.GAME.current_round.hands_played >= 1 and not context.blueprint then
            card.ability.fainted = G.GAME.round
            card.ability.extra.you_failed = true
            card:set_debuff()
        end
    end
}
pokermon.add_family { "wimpod", "golisopod" }
return { list = { wimpod, golisopod } }
