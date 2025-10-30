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

