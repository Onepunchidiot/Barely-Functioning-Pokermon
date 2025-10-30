local finizen = {
    name = "finizen",
    config = { extra = { chips = 40, rounds = 3 } },
    loc_vars = function(self, info_queue, card)
        type_tooltip(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.rounds } }
    end,
    rarity = 1,
    cost = 4,
    stage = "Basic",
    ptype = "Water",
    gen = 9,
    blueprint_compat = true,
    eternal_compat = false,
    custom_pool_func = true,
    in_pool = function(self)
        return not G.GAME.pool_flags.bfp_transformation_time and pokemon_in_pool(self)
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return { chips = card.ability.extra.chips }
        end
        if context.end_of_round and context.cardarea == G.jokers then
            card.ability.extra.rounds = math.max(card.ability.extra.rounds - 1, 0)
            return { message = localize("poke_evolve_level") }
        end
        if context.starting_shop and card.ability.extra.rounds == 0 then
            local temp_card = { set = "Joker", area = G.shop_jokers, key = "j_bfp_palafin" }
            local new_card = SMODS.create_card(temp_card)
            if G.GAME.shop.joker_max == 1 then
                G.shop_jokers.config.card_limit = G.GAME.shop.joker_max + 1
                G.shop_jokers.T.w = math.min((G.GAME.shop.joker_max + 1) * 1.02 * G.CARD_W, 4.08 * G.CARD_W)
                G.shop:recalculate()
            end
            new_card.states.visible = false
            G.shop_jokers:emplace(new_card)
            new_card:start_materialize()
            new_card:set_cost()
            create_shop_card_ui(new_card)

            if (SMODS.Mods["Talisman"] or {}).can_load then
                if Talisman.config_file.disable_anims then
                    new_card.states.visible = true
                end
            end
            card:juice_up()

            new_card.cost = 0
            G.E_MANAGER:add_event(Event({
                func = function()
                    remove(self, card, context, true)
                    return true
                end
            }))
            return { message = localize("bfp_flipturn_ex") }
        end
    end
}
local palafin = {
    name = "palafin",
    config = { extra = { chips = 70, rounds = 4 } },
    loc_vars = function(self, info_queue, card)
        type_tooltip(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.rounds } }
    end,
    rarity = 1,
    cost = 6,
    stage = "One",
    ptype = "Water",
    gen = 9,
    blueprint_compat = true,
    eternal_compat = false,
    custom_pool_func = true,
    atlas = "AtlasJokersBasicGen09",
    pos = { x = 6, y = 1 },
    in_pool = function()
        return false
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return { chips = card.ability.extra.chips }
        end
        if context.end_of_round and context.cardarea == G.jokers then
            card.ability.extra.rounds = math.max(card.ability.extra.rounds - 1, 0)
            return { message = localize("poke_evolve_level") }
        end
        if context.starting_shop and card.ability.extra.rounds == 0 then
            G.GAME.pool_flags.bfp_transformation_time = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    remove(self, card, context, true)
                    return true
                end
            }))
            return { message = localize("bfp_GymArc_ex") }
        end
    end
}
local palafin_hero = {
    name = "palafin_hero",
    config = { extra = { chips = 100, Xmult_multi = 0.1, chip_mod = 10 } },
    loc_vars = function(self, info_queue, card)
        type_tooltip(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.chip_mod, card.ability.extra.Xmult_multi } }
    end,
    rarity = 1,
    cost = 6,
    stage = "One",
    ptype = "Water",
    gen = 9,
    blueprint_compat = true,
    eternal_compat = false,
    custom_pool_func = true,
    atlas = "AtlasJokersBasicGen09",
    pos = { x = 8, y = 1 },
    in_pool = function(self)
        return G.GAME.pool_flags.bfp_transformation_time and pokemon_in_pool(self)
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return { chips = card.ability.extra.chips }
        end
        if context.individual and context.cardarea == G.play and context.other_card == context.scoring_hand[1] then
            context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
            context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus +
                card.ability.extra.chip_mod
            if SMODS.has_enhancement(context.other_card, "m_bonus") then
                card_eval_status_text(context.other_card, 'extra', nil, nil, nil,
                    { message = localize('bfp_jetpunch_ex'), colour = G.C.CHIPS })
                context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult or 1
                context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult +
                    card.ability.extra.Xmult_multi
            else
                card_eval_status_text(context.other_card, 'extra', nil, nil, nil,
                    { message = localize('bfp_aquajet_ex'), colour = G.C.CHIPS })
            end
        end
    end
}
pokermon.add_family { "finizen", "palafin", "palafin_hero" }
return { list = { finizen, palafin, palafin_hero } }
