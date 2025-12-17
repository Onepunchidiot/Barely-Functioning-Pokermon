local rowlet = {
    name = "rowlet",
    config = { extra = { dollars = 3, poker_hand = 'High Card', rounds = 4, h_size = 1 } },
    loc_vars = function(self, info_queue, card)
        type_tooltip(self, info_queue, card)
        return { vars = { card.ability.extra.dollars, localize(card.ability.extra.poker_hand, 'poker_hands'), card.ability.extra.rounds } }
    end,
    rarity = 2,
    cost = 6,
    stage = "Basic",
    ptype = "Grass",
    gen = 7,
    starter = true,
    blueprint_compat = true,
    eternal_compat = true,
    calculate = function(self, card, context)
        if context.before and context.scoring_name == card.ability.extra.poker_hand then
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
            return {
                dollars = card.ability.extra.dollars,
                func = function() -- This is for timing purposes, it runs after the dollar manipulation
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.dollar_buffer = 0
                            return true
                        end
                    }))
                end
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            local _poker_hands = {}
            for handname, _ in pairs(G.GAME.hands) do
                if SMODS.is_poker_hand_visible(handname) and handname ~= card.ability.extra.poker_hand then
                    _poker_hands[#_poker_hands + 1] = handname
                end
            end
            card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, 'vremade_to_do')
        end
        return level_evo(self, card, context, "j_bfp_dartrix")
    end,
    set_ability = function(self, card, initial, delay_sprites)
        local _poker_hands = {}
        for handname, _ in pairs(G.GAME.hands) do
            if SMODS.is_poker_hand_visible(handname) and handname ~= card.ability.extra.poker_hand then
                _poker_hands[#_poker_hands + 1] = handname
            end
        end
        card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, 'vremade_to_do')
    end,
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.h_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.h_size)
    end,
}
local dartrix = {
    name = "dartrix",
    config = { extra = { dollars = 4, poker_hand = 'High Card', rounds = 4, h_size = 1, earned = 0 }, evo_rqmt = 20 },
    loc_vars = function(self, info_queue, card)
        type_tooltip(self, info_queue, card)
        return { vars = { card.ability.extra.dollars, localize(card.ability.extra.poker_hand, 'poker_hands'), card.ability.extra.rounds } }
    end,
    rarity = 2,
    cost = 6,
    stage = "One",
    ptype = "Grass",
    gen = 7,
    blueprint_compat = true,
    eternal_compat = true,
    calculate = function(self, card, context)
        if context.before and context.scoring_name == card.ability.extra.poker_hand then
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
            card.ability.extra.earned = card.ability.extra.earned + card.ability.extra.dollars
            return {
                dollars = card.ability.extra.dollars,
                func = function() -- This is for timing purposes, it runs after the dollar manipulation
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.dollar_buffer = 0
                            return true
                        end
                    }))
                end
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            local _poker_hands = {}
            for handname, _ in pairs(G.GAME.hands) do
                if SMODS.is_poker_hand_visible(handname) and handname ~= card.ability.extra.poker_hand then
                    _poker_hands[#_poker_hands + 1] = handname
                end
            end
            card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, 'vremade_to_do')
        end
        local evo = scaling_evo(self, card, context, "j_bfp_hisuian_decidueye", card.ability.extra.earned,
            self.config.evo_rqmt)
        if evo then
            return evo
        else
            return level_evo(self, card, context, "j_bfp_decidueye")
        end
    end,
    set_ability = function(self, card, initial, delay_sprites)
        local _poker_hands = {}
        for handname, _ in pairs(G.GAME.hands) do
            if SMODS.is_poker_hand_visible(handname) and handname ~= card.ability.extra.poker_hand then
                _poker_hands[#_poker_hands + 1] = handname
            end
        end
        card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, 'vremade_to_do')
    end,
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.h_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.h_size)
    end,
}
local decidueye = {
    name = "decidueye",
    config = { extra = { dollars = 4, poker_hand = 'High Card', rounds = 4, h_size = 1, hand_count = 0 } },
    loc_vars = function(self, info_queue, card)
        type_tooltip(self, info_queue, card)
        return { vars = { card.ability.extra.dollars, localize(card.ability.extra.poker_hand, 'poker_hands'), card.ability.extra.rounds } }
    end,
    rarity = "poke_safari",
    cost = 10,
    stage = "Two",
    ptype = "Grass",
    gen = 7,
    blueprint_compat = true,
    eternal_compat = true,
    calculate = function(self, card, context)
        if context.before and context.scoring_name == card.ability.extra.poker_hand then
            G.hand:change_size(card.ability.extra.h_size)
            card.ability.extra.hand_count = card.ability.extra.hand_count + 1
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
            return {
                dollars = card.ability.extra.dollars,
                func = function() -- This is for timing purposes, it runs after the dollar manipulation
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.dollar_buffer = 0
                            return true
                        end
                    }))
                end
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval then
            G.hand:change_size(-card.ability.extra.hand_count)
            card.ability.extra.hand_count = 0
            if not context.blueprint then
                local _poker_hands = {}
                for handname, _ in pairs(G.GAME.hands) do
                    if SMODS.is_poker_hand_visible(handname) and handname ~= card.ability.extra.poker_hand then
                        _poker_hands[#_poker_hands + 1] = handname
                    end
                end
                card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, 'vremade_to_do')
            end
        end
    end,
    set_ability = function(self, card, initial, delay_sprites)
        local _poker_hands = {}
        for handname, _ in pairs(G.GAME.hands) do
            if SMODS.is_poker_hand_visible(handname) and handname ~= card.ability.extra.poker_hand then
                _poker_hands[#_poker_hands + 1] = handname
            end
        end
        card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, 'vremade_to_do')
    end,
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.h_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.h_size)
    end,
}
local hisuian_decidueye = {
    name = "hisuian_decidueye",
    config = { extra = { money1 = 5, faces = 3, hand_count = 0, jack_discard, queen_discard, king_discard, hands = 1, } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money1, card.ability.extra.faces, card.ability.extra.hands, } }
    end,
    rarity = "poke_safari",
    designer="Gem",
    cost = 10,
    stage = "Two",
    ptype = "Fighting",
    gen = 7,
    blueprint_compat = true,
    eternal_compat = true,
    atlas = "AtlasJokersBasicGen07",
    pos = { x = 6, y = 5 },
    calculate = function(self, card, context)
        if context.discard and context.other_card == context.full_hand[#context.full_hand] then
            local face_cards = 0
            for _, discarded_card in ipairs(context.full_hand) do
                if discarded_card:get_id() == 11 and not jack_discard then
                    ease_discard(1)
                    jack_discard = true
                end
                if discarded_card:get_id() == 12 and not queen_discard then
                    G.hand:change_size(1)
                    queen_discard = true
                end
                if discarded_card:get_id() == 13 and not king_discard then
                    ease_hands_played(1)
                    king_discard = true
                end
                if discarded_card:is_face() then face_cards = face_cards + 1 end
            end
            if face_cards >= card.ability.extra.faces then
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.money1
                return {
                    dollars = card.ability.extra.money1,
                    func = function() -- This is for timing purposes, it runs after the dollar manipulation
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.GAME.dollar_buffer = 0
                                return true
                            end
                        }))
                    end
                }
            end
        end
    end,
}
pokermon.add_family { "rowlet", "dartrix", "decidueye", "hisuian_decidueye" }
return { list = { rowlet, dartrix, decidueye, hisuian_decidueye } }
