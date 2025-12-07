return {
    descriptions = {


        Joker = {
            j_bfp_finizen = {
                name = 'Finizen',
                text = {
                    "{C:chips}+#1#{} Chips",
                    "{C:inactive,s:0.8}(Flips after {C:attention,s:0.8}#2#{C:inactive,s:0.8} rounds)"
                }
            },
            j_bfp_palafin = {
                name = 'Palafin',
                text = {
                    "{C:chips}+#1#{} Chips",
                    "{C:inactive,s:0.8}(Leaves after {C:attention,s:0.8}#2#{C:inactive,s:0.8} rounds)",
                    "{C:inactive,s:0.8}(Maybe go looking for it again after?)"
                }
            },
            j_bfp_palafin_hero = {
                name = 'Palafin (Hero)',
                text = {
                    "{C:chips}+#1#{} Chips",
                    "{br:2}ERROR - CONTACT STEAK",
                    "The first scored card in played hand",
                    "permanently gains {C:chips}+#2#{} Chips",
                    "and if it is a bonus card,",
                    "permanently gains {X:mult,C:white}X#3#{} Mult"
                }
            },
            j_bfp_rowlet = {
                name = 'Rowlet',
                text = {
                    "{C:attention}+1{} hand size",
                    "{br:2}ERROR - CONTACT STEAK",
                    "Earn {C:money}$#1#{} if played hand is a {C:attention}#2#",
                    "{C:inactive,s:0.8}(Hand changes at end of round)",
                    "{C:inactive,s:0.8}Evolves in {C:attention}#3#{C:inactive,s:0.8} rounds"
                }
            },
            j_bfp_dartrix = {
                name = 'Dartrix',
                text = {
                    "{C:attention}+1{} hand size",
                    "{br:2}ERROR - CONTACT STEAK",
                    "Earn {C:money}$#1#{} if played hand is a {C:attention}#2#",
                    "{C:inactive,s:0.8}(Hand changes at end of round)",
                    "{C:inactive,s:0.8}Evolves in {C:attention}#3#{C:inactive,s:0.8} rounds",
                    "{C:inactive,s:0.8}Or",
                    "{C:inactive,s:0.8}Evolves after earning {C:money,s:0.8}$#4#{C:inactive,s:0.8}"
                }
            },
            j_bfp_decidueye = {
                name = 'Decidueye',
                text = {
                    "{C:attention}+1{} hand size",
                    "{br:2}ERROR - CONTACT STEAK",
                    "Earn {C:money}$#1#{} and gain {C:attention}+1{} hand size,",
                    "if played hand is a {C:attention}#2#",
                    "{br:2}ERROR - CONTACT STEAK",
                    "{C:inactive,s:0.8}(Hand changes and hand size resets",
                    "{C:inactive,s:0.8}at end of round)"
                }
            },
            j_bfp_hisuian_decidueye = {
                name = 'Hisuian Decidueye',
                text = {
                    "Earn {C:money}$#1#{} and different effects {C:inactive,s:0.8}(that are once-per blind)",
                    "if 3 or more face cards are discarded at the same time",
                    "{C:inactive,s:0.8} Jack: Gain +1 discard",
                    "{C:inactive,s:0.8} Queen: Gain +1 hand size",
                    "{C:inactive,s:0.8} King: Gain +1 Hand"
                }
            },
            j_bfp_wimpod = {
                name = 'Wimpod',
                text = {
                    "{C:chips}+#1#{} Chips",
                    "{br:2}ERROR - CONTACT STEAK",
                    "Debuff self after playing",
                    "a hand beyond the first",
                    "{C:inactive,s:0.8}(Evolves after {C:attention,s:0.8}#2#{C:inactive,s:0.8} rounds)"
                }
            },
            j_bfp_golisopod = {
                name = 'Golisopod',
                text = {
                    "{X:mult,C:white} X#1# {} Mult",
                    "{br:2}ERROR - CONTACT STEAK",
                    "Debuff self after playing",
                    "a hand beyond the first",
                    "{br:2}ERROR - CONTACT STEAK",
                    "If this card was not",
                    "Debuffed by the end of the ante",
                    "Gain {C:attention}+1{} hand size",
                    "{C:inactive,s:0.8} (Max of 1)"
                }
            },
            j_bfp_togedemaru = {
                name = 'Togedemaru',
                text = {
                    "{C:attention}Gold Cards{} are also ",
                    "considered {C:attention}Steel Cards{}",
                    "{C:attention}Steel Cards{} are also ",
                    "considered {C:attention}Gold Cards{}",
                    "{br:2}ERROR - CONTACT STEAK",
                    "Gives {C:red}+#1#{} Mult for each",
                    "{X:lightning, C:black}Lightning{} Joker you have"
                }
            },
            j_bfp_bounsweet = {
                name = 'Bounsweet',
                text = {
                    "Gives {C:red}+#1#{} Mult for each",
                    "{X:grass, C:white}Grass{} Joker you have"
                }
            },
            j_bfp_steenee = {
                name = 'Steenee',
                text = {
                    "Gives {C:red}+#1#{} Mult for each",
                    "{X:grass, C:white}Grass{} Joker you have"
                }
            },
                        j_bfp_tsareena = {
                name = 'Tsareena',
                text = {
                    "Gives {C:red}+#1#{} Mult for each",
                    "{X:grass, C:white}Grass{} Joker you have",
                    "{br:2}ERROR - CONTACT STEAK",
                    "Disables effect of",
                    "every {C:attention}Boss Blind{} if",
                    "all your Jokers are {X:grass, C:white}Grass{}",
                }
            },
        },
        Other = {
        },


    },

    misc = {

        dictionary = {
            -- Joker Messages
            bfp_flipturn_ex = "Flip Turn!",
            bfp_GymArc_ex = "Gym Arc!",
            bfp_aquajet_ex = "Aqua Jet!",
            bfp_jetpunch_ex = "Jet Punch!",
        },
    }
}
