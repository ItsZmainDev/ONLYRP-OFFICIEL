DP = {}

DP.Expressions = {
   ["En colère"] = {"Expression", "mood_angry_1"},
   ["Ivre"] = {"Expression", "mood_drunk_1"},
   ["Stupide"] = {"Expression", "pose_injured_1"},
   ["Électrocuté"] = {"Expression", "electrocuted_1"},
   ["Grincheux 1"] = {"Expression", "effort_1"},
   ["Grincheux 2"] = {"Expression", "mood_drivefast_1"},
   ["Grincheux 3"] = {"Expression", "pose_angry_1"},
   ["Heureux"] = {"Expression", "mood_happy_1"},
   ["Blessé"] = {"Expression", "mood_injured_1"},
   ["Joyeux"] = {"Expression", "mood_dancing_low_1"},
   ["Respiration de la bouche"] = {"Expression", "smoking_hold_1"},
   ["Ne jamais cligner des yeux"] = {"Expression", "pose_normal_1"},
   ["Un oeil"] = {"Expression", "pose_aiming_1"},
   ["Sous le choc"] = {"Expression", "shocked_1"},
   ["Sous le choc2"] = {"Expression", "shocked_2"},
   ["En train de dormir"] = {"Expression", "mood_sleeping_1"},
   ["En train de dormir2"] = {"Expression", "dead_1"},
   ["En train de dormir3"] = {"Expression", "dead_2"},
   ["Suffisant(e)"] = {"Expression", "mood_smug_1"},
   ["Spéculatif"] = {"Expression", "mood_aiming_1"},
   ["Stressé"] = {"Expression", "mood_stressed_1"},
   ["Bouder"] = {"Expression", "mood_sulk_1"},
   ["Bizarre"] = {"Expression", "effort_2"},
   ["Bizarre2"] = {"Expression", "effort_3"},
   ["Retenir la fumée"] = {"Expression", "smoking_hold_1"},
}

Config = {
	MenuLanguage = 'en',	
}

Config.Languages = {
  ['en'] = {}
}

DP.Walks = {
  ["Alien"] = {"move_m@alien"},
  ["Mastodonte"] = {"anim_group_move_ballistic"},
  ["Arrogant"] = {"move_f@arrogant@a"},
  ["Brave"] = {"move_m@brave"},
  ["Décontracté"] = {"move_m@casual@a"},
  ["Décontracté 2"] = {"move_m@casual@b"},
  ["Décontracté 3"] = {"move_m@casual@c"},
  ["Décontracté 4"] = {"move_m@casual@d"},
  ["Décontracté 5"] = {"move_m@casual@e"},
  ["Décontracté 6"] = {"move_m@casual@f"},
  ["Chichi"] = {"move_f@chichi"},
  ["Confident"] = {"move_m@confident"},
  ["Police"] = {"move_m@business@a"},
  ["Police 2"] = {"move_m@business@b"},
  ["Police 3"] = {"move_m@business@c"},
  ["Femme par défaut"] = {"move_f@multiplayer"},
  ["Homme par défaut"] = {"move_m@multiplayer"},
  ["Ivre"] = {"move_m@drunk@a"},
  ["Ivre léger"] = {"move_m@drunk@slightlydrunk"},
  ["Ivre 2"] = {"move_m@buzzed"},
  ["Ivre Mort"] = {"move_m@drunk@verydrunk"},
  ["Femme"] = {"move_f@femme@"},
  ["Feu"] = {"move_characters@franklin@fire"},
  ["Feu 2"] = {"move_characters@michael@fire"},
  ["Feu 3"] = {"move_m@fire"},
  ["Fuir"] = {"move_f@flee@a"},
  ["Franklin"] = {"move_p_m_one"},
  ["Gangster"] = {"move_m@gangster@generic"},
  ["Gangster 2"] = {"move_m@gangster@ng"},
  ["Gangster 3"] = {"move_m@gangster@var_e"},
  ["Gangster 4"] = {"move_m@gangster@var_f"},
  ["Gangster 5"] = {"move_m@gangster@var_i"},
  ["S'enjailler"] = {"anim@move_m@grooving@"},
  ["Garde"] = {"move_m@prison_gaurd"},
  ["Menotte par devant"] = {"move_m@prisoner_cuffed"},
  ["Talons"] = {"move_f@heels@c"},
  ["Talons 2"] = {"move_f@heels@d"},
  ["Randonnée"] = {"move_m@hiking"},
  ["Hipster"] = {"move_m@hipster@a"},
  ["Hobo"] = {"move_m@hobo@a"},
  ["Se dépêcher"] = {"move_f@hurry@a"},
  ["Concierge"] = {"move_p_m_zero_janitor"},
  ["Concierge 2"] = {"move_p_m_zero_slow"},
  ["Faire du jogging"] = {"move_m@jog@"},
  ["Lemar"] = {"anim_group_move_lemar_alley"},
  ["Lester"] = {"move_heist_lester"},
  ["Lester 2"] = {"move_lester_caneup"},
  ["Croqueuse d'homme"] = {"move_f@maneater"},
  ["Michael"] = {"move_ped_bucket"},
  ["Fricé"] = {"move_m@money"},
  ["Musclé"] = {"move_m@muscle@a"},
  ["Chic"] = {"move_m@posh@"},
  ["Chic 2"] = {"move_f@posh@"},
  ["Rapide"] = {"move_m@quick"},
  ["Coureur"] = {"female_fast_runner"},
  ["Triste"] = {"move_m@sad@a"},
  ["Impertinent"] = {"move_m@sassy"},
  ["Impertinent 2"] = {"move_f@sassy"},
  ["Effrayé"] = {"move_f@scared"},
  ["Sexy"] = {"move_f@sexy@a"},
  ["Ombreux"] = {"move_m@shadyped@a"},
  ["Lent"] = {"move_characters@jimmy@slow@"},
  ["Swagger"] = {"move_m@swagger"},
  ["Dur"] = {"move_m@tough_guy@"},
  ["Dur 2"] = {"move_f@tough_guy@"},
  ["Poubelle"] = {"clipset@move@trash_fast_turn"},
  ["Poubelle 2"] = {"missfbi4prepp1_garbageman"},
  ["Trevor"] = {"move_p_m_two"},
  ["Large"] = {"move_m@bag"},
  -- I cant get these to work for some reason, if anyone knows a fix lmk
  --["Caution"] = {"move_m@caution"},
  --["Chubby"] = {"anim@move_m@chubby@a"},
  --["Crazy"] = {"move_m@crazy"},
  --["Joy"] = {"move_m@joy@a"},
  --["Power"] = {"move_m@power"},
  --["Sad2"] = {"anim@move_m@depression@a"},
  --["Sad3"] = {"move_m@depression@b"},
  --["Sad4"] = {"move_m@depression@d"},
  --["Wading"] = {"move_m@wading"},
}

DP.Shared = {
   --[emotename] = {dictionary, animation, displayname, targetemotename, additionalanimationoptions}
   -- you dont have to specify targetemoteanem, if you do dont it will just play the same animation on both.
   -- targetemote is used for animations that have a corresponding animation to the other player.
   ["handshake"] = {"mp_ped_interaction", "handshake_guy_a", "poignée de main", "handshake2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000,
       SyncOffsetFront = 0.9
   }},
   ["handshake2"] = {"mp_ped_interaction", "handshake_guy_b", "poignée de main 2", "handshake", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000
   }},
   ["hug"] = {"mp_ped_interaction", "kisses_guy_a", "Calin", "hug2", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 5000,
       SyncOffsetFront = 1.05,
   }},
   ["hug2"] = {"mp_ped_interaction", "kisses_guy_b", "Calin 2", "hug", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 5000,
       SyncOffsetFront = 1.13
   }},
}

DP.Dances = {
    ["jdrill"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_13_v1_male^3", "Drill · Male", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jdrill2"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "mi_dance_crowd_13_v2_male^1", "Drill · Male 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jdrill3"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_17_v2_male^4", "Drill · Male 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jdrill4"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_15_v2_male^4", "Drill · Male 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jdrill5"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_v2_male^5", "Drill · Male 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jdrill6"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_17_male^5", "Drill · Male 6", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jdrill7"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "high_right_up", "Drill · Solo 1", AnimationOptions =
   {
       EmoteLoop = true,
    }},
    ["jdrill8"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "med_center", "Drill · Solo 2", AnimationOptions =
    {
        EmoteLoop = true,
     }},
    ["jdrill9"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "high_right_down", "Drill · Solo 3", AnimationOptions =
     {
         EmoteLoop = true,
      }}, 
      ["jdrill10"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "high_center", "Drill · Solo 4", AnimationOptions =
     {
         EmoteLoop = true,
      }}, 
      ["crossbounce"] = {"custom@crossbounce", "crossbounce", "Fornite 1", AnimationOptions =
  {
     EmoteMoving = false,
     EmoteLoop = true,
  }},

  ["dontstart"] = {"custom@dont_start", "dont_start", "Fornite 2", AnimationOptions =
  {
     EmoteMoving = false,
     EmoteLoop = true,
  }},

  ["floss"] = {"custom@floss", "floss", "Fornite 3", AnimationOptions =
  {
     EmoteMoving = false,
     EmoteLoop = true,
  }},

  ["orangejustice"] = {"custom@orangejustice", "orangejustice", "Fornite 4", AnimationOptions =
  {
     EmoteMoving = false,
     EmoteLoop = true,
  }},

  ["renegade"] = {"custom@renegade", "renegade", "Fornite 5", AnimationOptions =
  {
     EmoteMoving = false,
     EmoteLoop = true,
  }},

  ["rickroll"] = {"custom@rickroll", "rickroll", "Fornite 6", AnimationOptions =
  {
     EmoteMoving = false,
     EmoteLoop = true,
  }},

  ["savage"] = {"custom@savage", "savage", "Fornite 7", AnimationOptions =
  {
     EmoteMoving = false,
     EmoteLoop = true,
  }},

  ["sayso"] = {"custom@sayso", "sayso", "Fornite 8", AnimationOptions =
  {
     EmoteMoving = false,
     EmoteLoop = true,
  }},

  ["takel"] = {"custom@take_l", "take_l", "Fornite 9", AnimationOptions =
  {
     EmoteMoving = false,
     EmoteLoop = true,
  }},

  ["tslide"] = {"custom@toosie_slide", "toosie_slide", "Fornite 10", AnimationOptions =
  {
     EmoteMoving = false,
     EmoteLoop = true,
  }},
  ["clock"] = {"custom@around_the_clock", "around_the_clock", "Fornite 11", AnimationOptions =
  {
     EmoteMoving = false,
     EmoteLoop = true,
  }},
  
  ["dancemoves"] = {"custom@dancemoves", "dancemoves", "Fornite 12", AnimationOptions =
  {
     EmoteMoving = false,
     EmoteLoop = true,
  }},
  
  ["discodance"] = {"custom@disco_dance", "disco_dance", "Fornite 13", AnimationOptions =
  {
     EmoteMoving = false,
     EmoteLoop = true,
  }},
  
  ["electroshuffle"] = {"custom@electroshuffle_original", "electroshuffle_original", "Fornite 14", AnimationOptions =
  {
     EmoteMoving = false,
     EmoteLoop = true,
  }},
  
  ["electroshuffle2"] = {"custom@electroshuffle", "electroshuffle", "Fornite 15", AnimationOptions =
  {
     EmoteMoving = false,
     EmoteLoop = true,
  }},
  
  ["fresh"] = {"custom@fresh_fortnite", "fresh_fortnite", "Fornite 16", AnimationOptions =
  {
     EmoteMoving = false,
     EmoteLoop = true,
  }},
  
  ["gylphic"] = {"custom@gylphic", "gylphic", "Fornite 17", AnimationOptions =
  {
     EmoteMoving = false,
     EmoteLoop = true,
  }},
  
  ["hitit"] = {"custom@hitit", "hitit", "Fornite 18", AnimationOptions =
  {
     EmoteMoving = false,
     EmoteLoop = true,
  }},
  
  ["inparty"] = {"custom@in_da_party", "in_da_party", "Fornite 19", AnimationOptions =
  {
     EmoteMoving = false,
     EmoteLoop = true,
  }},
  
  ["robotdance"] = {"custom@robotdance_fortnite", "robotdance_fortnite", "Fornite 20", AnimationOptions =
  {
     EmoteMoving = false,
     EmoteLoop = true,
  }},
  
  ["frightfunk"] = {"custom@frightfunk", "frightfunk", "Fornite 21", AnimationOptions =
  {
     EmoteMoving = false,
     EmoteLoop = true,
  }},
  
  ["gloss"] = {"custom@gloss", "gloss", "Fornite 22", AnimationOptions =
  {
     EmoteMoving = false,
     EmoteLoop = true,
  }},
  
  ["lastforever"] = {"custom@last_forever", "last_forever", "Fornite 23", AnimationOptions =
  {
     EmoteMoving = false,
     EmoteLoop = true,
  }},
  
  ["smoothmoves"] = {"custom@smooth_moves", "smooth_moves", "Fornite 24", AnimationOptions =
  {
     EmoteMoving = false,
     EmoteLoop = true,
  }},
  
  ["introducing"] = {"custom@introducing", "introducing", "Fornite 25", AnimationOptions =
  {
     EmoteMoving = false,
     EmoteLoop = true,
  }},
  
   ["dancef"] = {"anim@amb@nightclub@dancers@solomun_entourage@", "mi_dance_facedj_17_v1_female^1", "Danse Femme", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancef2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center", "Danse Femme 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancef3"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center_up", "Danse Femme 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancef4"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_female^1", "Danse Femme 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancef5"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_female^3", "Danse Femme 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancef6"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center_up", "Danse Femme 6", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danceslow2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_center", "Danse Slow 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danceslow3"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_center_down", "Danse Slow 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danceslow4"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_center", "Danse Slow 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dance"] = {"anim@amb@nightclub@dancers@podium_dancers@", "hi_dance_facedj_17_v2_male^5", "Danse", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dance2"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "high_center_down", "Danse 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dance3"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "high_center", "Danse 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dance4"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "high_center_up", "Danse 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danceupper"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_center", "Danse Upper", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["danceupper2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_center_up", "Danse Upper 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["danceshy"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "low_center", "Danse timide", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danceshy2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_center_down", "Danse timide 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danceslow"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "low_center", "Danse lente", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancesilly9"] = {"rcmnigel1bnmt_1b", "dance_loop_tyler", "Danse idiote 9", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dance6"] = {"misschinese2_crystalmazemcs1_cs", "dance_loop_tao", "Danse 6", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dance7"] = {"misschinese2_crystalmazemcs1_ig", "dance_loop_tao", "Danse 7", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dance8"] = {"missfbi3_sniping", "dance_m_default", "Danse 8", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancesilly"] = {"special_ped@mountain_dancer@monologue_3@monologue_3a", "mnt_dnc_buttwag", "Danse idiote", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancesilly2"] = {"move_clown@p_m_zero_idles@", "fidget_short_dance", "Danse idiote 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancesilly3"] = {"move_clown@p_m_two_idles@", "fidget_short_dance", "Danse idiote 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancesilly4"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_hi_11_buttwiggle_b_laz", "Danse idiote 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancesilly5"] = {"timetable@tracy@ig_5@idle_a", "idle_a", "Danse idiote 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancesilly6"] = {"timetable@tracy@ig_8@idle_b", "idle_d", "Danse idiote 6", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dance9"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "med_center_up", "Danse 9", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancesilly8"] = {"anim@mp_player_intcelebrationfemale@the_woogie", "the_woogie", "Danse idiote 8", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["dancesilly7"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "high_center", "Danse idiote 7", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["dance5"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "med_center", "Danse 5", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["danceglowstick"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_13_mi_hi_sexualgriding_laz", "Danse avec bâtons lumineux", AnimationOptions =
   {
       Prop = 'ba_prop_battle_glowstick_01',
       PropBone = 28422,
       PropPlacement = {0.0700,0.1400,0.0,-80.0,20.0},
       SecondProp = 'ba_prop_battle_glowstick_01',
       SecondPropBone = 60309,
       SecondPropPlacement = {0.0700,0.0900,0.0,-120.0,-20.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["danceglowstick2"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_12_mi_hi_bootyshake_laz", "Danse avec bâtons lumineux 2", AnimationOptions =
   {
       Prop = 'ba_prop_battle_glowstick_01',
       PropBone = 28422,
       PropPlacement = {0.0700,0.1400,0.0,-80.0,20.0},
       SecondProp = 'ba_prop_battle_glowstick_01',
       SecondPropBone = 60309,
       SecondPropPlacement = {0.0700,0.0900,0.0,-120.0,-20.0},
       EmoteLoop = true,
   }},
   ["danceglowstick3"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_09_mi_hi_bellydancer_laz", "Danse avec bâtons lumineux 3", AnimationOptions =
   {
       Prop = 'ba_prop_battle_glowstick_01',
       PropBone = 28422,
       PropPlacement = {0.0700,0.1400,0.0,-80.0,20.0},
       SecondProp = 'ba_prop_battle_glowstick_01',
       SecondPropBone = 60309,
       SecondPropPlacement = {0.0700,0.0900,0.0,-120.0,-20.0},
       EmoteLoop = true,
   }},
   ["dancehorse"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_li_15_handup_laz", "Danse de cheval", AnimationOptions =
   {
       Prop = "ba_prop_battle_hobby_horse",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["dancehorse2"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "crowddance_hi_11_handup_laz", "Danse de cheval 2", AnimationOptions =
   {
       Prop = "ba_prop_battle_hobby_horse",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
   }},
   ["dancehorse3"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_li_11_hu_shimmy_laz", "Danse de cheval 3", AnimationOptions =
   {
       Prop = "ba_prop_battle_hobby_horse",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
   }},
   ["unclej"] = {"anim@mp_player_intcelebrationfemale@uncle_disco", "uncle_disco", "Uncle Josh", AnimationOptions =
   {
       EmoteLoop = true,
   }},

    ["jmonkeyd"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "high_center", "Dance Singe", AnimationOptions =
   {
       EmoteLoop = true
    }},
    ["jmonkeyd2"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "high_center_down", "Dance Singe 2", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["jmonkeyd3"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "med_center_down", "Dance Singe 3", AnimationOptions =
    {
         EmoteLoop = true
    }},
    ["jrightdown"] = {"anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", "med_right_down", "Boxing Dance Solo", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["jhiphop"] = {"anim@amb@nightclub@mini@dance@dance_paired@dance_d@", "ped_a_dance_idle", "Hip Hop Dance", AnimationOptions =
    {
           EmoteLoop = true
    }},
    ["jhiphop2"] = {"anim@amb@nightclub@mini@dance@dance_paired@dance_b@", "ped_a_dance_idle", "Hip Hop Dance 2", AnimationOptions =
    {
           EmoteLoop = true
    }},
    ["jhiphop3"] = {"anim@amb@nightclub@mini@dance@dance_paired@dance_a@", "ped_a_dance_idle", "Hip Hop Dance 3", AnimationOptions =
    {
           EmoteLoop = true
    }},

}

DP.Emotes = {
    ["jpbox"] = {"mp_am_hold_up", "purchase_beerbox_shopkeeper", "Purchase Box", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 2500,
   }},
   ["jch"] = {"amb@code_human_police_investigate@idle_b", "idle_f", "Cop Search", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 7000,
   }},
   ["jgangsign5"] = {"anim@mp_player_intupperdock", "idle_a", "Gang Sign", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2500,
   }},
   ["jcheckwatch"] = {"amb@code_human_wander_idles_fat@male@idle_a", "idle_a_wristwatch", "Check Watch", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 5000,
   }},
   ["jpicking"] = {"amb@prop_human_movie_bulb@idle_a", "idle_a", "Picking", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2500,
   }},
   ["jgangaim"] = {"combat@aim_variations@1h@gang", "aim_variation_b", "Gang Aim", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["jshowboobs"] = {"mini@strip_club@backroom@", "stripper_b_backroom_idle_b", "Show Boobs", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 6000,
   }},
   ["jcleanleg"] = {"mini@strip_club@backroom@", "stripper_c_leadin_backroom_idle_a", "Clean Legs", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 6000,
   }},
   ["jshowboobs2"] = {"mini@strip_club@idles@stripper", "stripper_idle_05", "Show Boobs 2", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 6000,
   }},
   ["jlockcar"] = {"anim@mp_player_intmenu@key_fob@", "fob_click", "Lock Car", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2500,
   }},
   ["jselfie5"] = {"cellphone@self", "selfie", "Selfie 3", AnimationOptions =
   {
       EmoteMoving = false,
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
   }},
   ["jselfiewc"] = {"cellphone@self@franklin@", "west_coast", "Selfie West Coast", AnimationOptions =
   {
       EmoteMoving = false,
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
   }},
   ["jselfie3"] = {"cellphone@self@michael@", "finger_point", "Selfie Finger", AnimationOptions =
   {
       EmoteMoving = false,
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
   }},
   ["jselfie4"] = {"cellphone@self@franklin@", "chest_bump", "Selfie Chest Bump", AnimationOptions =
   {
       EmoteMoving = false,
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
   }},
   ["jSelfie1"] = {"cellphone@self@trevor@", "throat_slit", "Selfie", AnimationOptions =
   {
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["jSelfie2"] = {"cellphone@self@trevor@", "proud_finger", "Selfie 2", AnimationOptions =
   {
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = false,
   }},

   ["jkhaby"] = {"missarmenian3@simeon_tauntsidle_b", "areyounotman", "Khaby", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jdepressed"] = {"oddjobs@bailbond_hobodepressed", "base", "Depressed", AnimationOptions =
   {
    EmoteMoving = true,
   }},
   ["jcarsign"] = {"amb@code_human_in_car_mp_actions@gang_sign_a@bodhi@rds@base", "idle_a", "Gang Sign Car", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2500,
   }},
   ["jcarsign2"] = {"amb@code_human_in_car_mp_actions@gang_sign_a@low@ds@base", "idle_a", "Gang Signs 2 · Car ", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2500,
   }},
   ["jcarlowrider"] = {"anim@veh@lowrider@low@front_ds@arm@base", "sit", "Lowrider Style · Car", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["jcarlowrider2"] = {"anim@veh@lowrider@std@ds@arm@music@mexicanidle_a", "idle", "Lowrider Mexican Style · Car", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},

   ["jreactiona"] = {"random@shop_robbery_reactions@", "absolutely", "Reaction Absolutely", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jreactanger"] = {"random@shop_robbery_reactions@", "anger_a", "Reaction Anger", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jreactwhy"] = {"random@shop_robbery_reactions@", "is_this_it", "Reaction Why", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jreactscrew"] = {"random@shop_robbery_reactions@", "screw_you", "Reaction Screw You", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jreactshock"] = {"random@shop_robbery_reactions@", "shock", "Reaction Shock", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jreactgoodc"] = {"missclothing", "good_choice_storeclerk", "Reaction Good Choice", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jtrynewc"] = {"clothingtie", "try_tie_neutral_c", "Try New Clothes", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jtrynewc2"] = {"clothingtie", "try_tie_neutral_d", "Try New Clothes 2 ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jreacteasy"] = {"gestures@m@car@std@casual@ds", "gesture_easy_now", "Reaction Easy Now", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jreactıwill"] = {"gestures@m@car@std@casual@ds", "gesture_i_will", "Reaction I will", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jreactnoway"] = {"gestures@m@car@std@casual@ds", "gesture_no_way", "Reaction No Way", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jreactbye"] = {"gestures@f@standing@casual", "gesture_bye_hard", "Reaction Bye Hard", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jreacthello"] = {"gestures@f@standing@casual", "gesture_hello", "Reaction Hello", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
      ["jlookatplayer"] = {"friends@frl@ig_1", "look_lamar", "Look At Player", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
     ["jreactgreat"] = {"mp_cp_welcome_tutgreet", "greet", "Great", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jfakepunch"] = {"missarmenian2", "fake_punch_walk_by_lamar", "Fake Punch", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 5000,
   }},
      ["jreactdamn"] = {"missheist_jewel", "damn", "Reaction Damn", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
     ["jimtellingyou"] = {"missheist_jewel", "im_telling_you", "I'm telling you", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jreactno"] = {"missheist_jewel", "despair", "Reaction No", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jdontkillme"] = {"missheist_jewel", "manageress_kneel_loop", "Dont Kill Me", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jbangbang"] = {"anim@mp_player_intcelebrationfemale@bang_bang", "bang_bang", "Bang Bang", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jtryshirtn"] = {"clothingshirt", "try_shirt_negative_a", "Try Shirt Negative", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jtryshirtp"] = {"clothingshirt", "try_shirt_positive_a", "Try Shirt Positive ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
      ["jtryshoes"] = {"clothingshoes", "try_shoes_positive_d", "Try Shoes ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
    ["jtryshoes2"] = {"clothingshoes", "try_shoes_positive_c", "Try Shoes 2 ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
    ["joverhere"] = {"friends@fra@ig_1", "over_here_idle_a", "Over Here ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
    ["jwashingface"] = {"missmic2_washing_face", "michael_washing_face", "Washing Face ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 5000,
   }},
    ["jlastday"] = {"misstrevor1", "ortega_outro_loop_ort", "Last Day ", AnimationOptions =
   {
    EmoteLoop = true,
   }},
    ["jtryg"] = {"mp_clothing@female@glasses", "try_glasses_positive_a", "Try Glasses · Female ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
    ["jpickup"] = {"pickup_object", "pickup_low", "Pick Up ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jstretchl"] = {"switch@franklin@bed", "stretch_long", "Stretch Long ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jhos"] = {"amb@world_human_hang_out_street@male_a@idle_a", "idle_a", "Hang Out Street · Male ", AnimationOptions =
   {
    EmoteLoop = true,
   }},
   ["jhos2"] = {"amb@world_human_hang_out_street@male_c@base", "base", "Hang Out Street 2 · Male ", AnimationOptions =
   {
    EmoteLoop = true,
   }},
   ["jguardaim"] = {"guard_reactions", "1hand_aiming_cycle", "Guard Aim ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jgready"] = {"switch@franklin@getting_ready", "002334_02_fras_v2_11_getting_dressed_exit", "Getting Ready ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jlao"] = {"move_clown@p_m_two_idles@", "fidget_look_at_outfit", "Look At Outfits ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 6000,
   }},
   ["jtoilet"] = {"switch@trevor@on_toilet", "trev_on_toilet_loop", "Have A Shit ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 5000,
   }},
   ["jtoilet2"] = {"timetable@trevor@on_the_toilet", "trevonlav_struggleloop", "Have A Shit 2 ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 5000,
   }},
   ["jcovermale2"] = {"amb@code_human_cower@male@base", "base", "Cover · Male ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jvalet"] = {"anim@amb@world_human_valet@normal@base@", "base_a_m_y_vinewood_01", "Valet ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jvalet2"] = {"anim@amb@world_human_valet@formal_right@base@", "base_a_m_y_vinewood_01", "Valet 2 ", AnimationOptions =
   {
    EmoteMoving = true,
    EmoteLoop = true,
   }},
   ["jsunbathem"] = {"amb@world_human_sunbathe@male@back@idle_a", "idle_c", "Sunbathe · Male ", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteLoop = true,
   }},
   ["jsunbathem2"] = {"amb@world_human_sunbathe@male@front@base", "base", "Sunbathe 2 · Male ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jleancar"] = {"anim@scripted@carmeet@tun_meet_ig2_race@", "base", "Lean Car ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["jcheckout"] = {"anim@amb@carmeet@checkout_car@male_a@idles", "idle_b", "Check Out · Female ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jcheckout2"] = {"anim@amb@carmeet@checkout_car@male_c@idles", "idle_a", "Check Out 2 · Male ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jcheckout"] = {"anim@amb@carmeet@checkout_car@female_d@base", "base", "Check Out 3 · Female ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jreadmessages"] = {"anim@amb@carmeet@take_photos@male_a@base", "base", "Read Messages · Male ", AnimationOptions =
   {
       EmoteMoving = false,
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
   }},
   ["jreadmessages2"] = {"anim@amb@carmeet@take_photos@female_b@base", "base", "Read Messages 2 · Female ", AnimationOptions =
   {
       EmoteMoving = false,  
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
   }},
   ["jlistenmusic"] = {"anim@amb@carmeet@listen_music@male_a@trans", "a_trans_d", "Listen Music ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 5000,
   }},
   ["jogger"] = {"move_f@jogger", "idle", "Jogger · Female ", AnimationOptions =
   {
       EmoteDuration = 2500,
       EmoteMoving = true,
   }},
   ["jogger2"] = {"move_m@jogger", "idle", "Jogger · Male ", AnimationOptions =
   {
       EmoteDuration = 2500,
       EmoteMoving = true,
   }},
   ["jwtf"] = {"mini@triathlon", "wot_the_fuck", "Wot The Fuck ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jucdt"] = {"mini@triathlon", "u_cant_do_that", "U Cant Do That ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jwarmup"] = {"mini@triathlon", "ig_2_gen_warmup_01", "Warmup ", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 5000,
   }},
   ["jwarmup2"] = {"mini@triathlon", "ig_2_gen_warmup_02", "Warmup 2 ", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 5000,
   }},
   ["jwarmup3"] = {"mini@triathlon", "jog_idle_f", "Warmup 3 ", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 5000,
   }},
   ["jwarmup4"] = {"mini@triathlon", "jog_idle_e", "Warmup 4 ", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 5000,
   }},
   ["jhmassage"] = {"missheistfbi3b_ig8_2", "cpr_loop_paramedic", "Heart Massage ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jpassout"] = {"missheistfbi3b_ig8_2", "cower_loop_victim", "Pass Out ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jddealer"] = {"amb@world_human_drug_dealer_hard@male@base", "base", "Drug Dealer · Male ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jswatch"] = {"amb@world_human_strip_watch_stand@male_c@idle_a", "idle_b", "Watch Strip · Male ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jcheckw"] = {"amb@world_human_bum_wash@male@high@base", "base", "Check Water ", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 5000,
   }},
   ["jwaitt"] = {"oddjobs@taxi@", "idle_a", "Wait Taxi ", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 5000,
   }},
   ["jnoway"] = {"oddjobs@towingpleadingbase", "base", "No Way ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jtsomething"] = {"oddjobs@bailbond_hobohang_out_street_c", "idle_c", "Tell Something ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jlfh"] = {"oddjobs@assassinate@old_lady", "looking_for_help", "Looking For Help ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 5000,
   }},
   ["jmstretch"] = {"oddjobs@assassinate@multi@", "idle_a", "Muscle Stretch ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 5000,
   }},
   ["jdj"] = {"anim@mp_player_intcelebrationmale@dj", "dj", "DJ ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jdj2"] = {"anim@scripted@nightclub@dj@dj_moodm@", "moodm_cdj_left_a_12", "DJ 2 ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jdj3"] = {"anim@amb@nightclub@djs@switch@dixn_djset_switchover@", "dix_end_bg_female1", "DJ 3 ", AnimationOptions =
   {
    EmoteLoop = true,
   }},
   ["jdj4"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", "trans_dance_facedj_li_to_mi_11_v1_male^3", "DJ 4 ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jlmic"] = {"anim@veh@lowrider@std@ds@arm@music@hiphopidle_a", "idle", "Listen Music In Car ", AnimationOptions =
   {
    EmoteMoving = true,
    EmoteDuration = 2500,
   }},
   ["jgotc"] = {"random@getawaydriver@thugs", "base_a", "Get Off The Car ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["jvsad"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_sleeping-noworkfemale", "Very Sad ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jdgrave"] = {"anim@amb@drug_field_workers@rake@male_a@base", "base", "Digging Grave ", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteLoop = true,
       Prop = 'prop_tool_shovel006',
       PropBone = 28422,
       PropPlacement = {0.0, 0.1, -0.6, 0.0, 0.0, 180.0},
   }},
   ["jbow3"] = {"missheistdockssetup1ig_10@base", "talk_pipe_base_worker1", "Bend Over Wait ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jweeding"] = {"anim@amb@drug_field_workers@weeding@male_a@base", "base", "Weeding · Male ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jlookplan"] = {"missheist_agency2aig_4", "look_plan_c_worker2", "Look Plan ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 5000,
   }},
   ["jgangdrink"] = {"amb@world_human_drinking_fat@beer@male@base", "base", "Gang Drink ", AnimationOptions =
   {
       Prop = 'prop_cs_beer_bot_40oz_03',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["jgangdrink"] = {"amb@world_human_drinking_fat@beer@male@idle_a", "idle_b", "Gang Drink 2 ", AnimationOptions =
   {
       Prop = 'prop_cs_beer_bot_40oz_03',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["jmleaning"] = {"amb@world_human_leaning@male@wall@back@mobile@base", "base", "Mobile Leaning · Male ", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteLoop = true,
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
   }},
   ["jthanks"] = {"random@arrests", "thanks_male_05", "Thanks ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jtextingmale"] = {"amb@world_human_stand_mobile_fat@male@text@base", "base", "Texting · Male ", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
   }},
   ["jffb"] = {"timetable@trevor@skull_loving_bear", "skull_loving_bear", "F*ck From Behind ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
}

DP.PropEmotes = {
   ["umbrella"] = {"amb@world_human_drinking@coffee@male@base", "base", "Tenir un parapluie", AnimationOptions =
   {
       Prop = "p_amb_brolly_01",
       PropBone = 57005,
       PropPlacement = {0.15, 0.005, 0.0, 87.0, -20.0, 180.0},
       --
       EmoteLoop = true,
       EmoteMoving = true,
   }},

-----------------------------------------------------------------------------------------------------
------ This is an example of an emote with 2 props, pretty simple! ----------------------------------
-----------------------------------------------------------------------------------------------------

   ["notepad"] = {"missheistdockssetup1clipboard@base", "base", "Ecrire sur un bloc note", AnimationOptions =
   {
       Prop = 'prop_notepad_01',
       PropBone = 18905,
       PropPlacement = {0.1, 0.02, 0.05, 10.0, 0.0, 0.0},
       SecondProp = 'prop_pencil_01',
       SecondPropBone = 58866,
       SecondPropPlacement = {0.11, -0.02, 0.001, -120.0, 0.0, 0.0},
       -- EmoteLoop is used for emotes that should loop, its as simple as that.
       -- Then EmoteMoving is used for emotes that should only play on the upperbody.
       -- The code then checks both values and sets the MovementType to the correct one
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["box"] = {"anim@heists@box_carry@", "idle", "Boîte", AnimationOptions =
   {
       Prop = "hei_prop_heist_box",
       PropBone = 60309,
       PropPlacement = {0.025, 0.08, 0.255, -145.0, 290.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["rose"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Tenir une rose", AnimationOptions =
   {
       Prop = "prop_single_rose",
       PropBone = 18905,
       PropPlacement = {0.13, 0.15, 0.0, -100.0, 0.0, -20.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["smoke2"] = {"amb@world_human_aa_smoke@male@idle_a", "idle_c", "Fumer 2", AnimationOptions =
   {
       Prop = 'prop_cs_ciggy_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["smoke3"] = {"amb@world_human_aa_smoke@male@idle_a", "idle_b", "Fumer 3", AnimationOptions =
   {
       Prop = 'prop_cs_ciggy_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["smoke4"] = {"amb@world_human_smoking@female@idle_a", "idle_b", "Fumer 4", AnimationOptions =
   {
       Prop = 'prop_cs_ciggy_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["bong"] = {"anim@safehouse@bong", "bong_stage3", "Bang", AnimationOptions =
   {
       Prop = 'hei_heist_sh_bong_01',
       PropBone = 18905,
       PropPlacement = {0.10,-0.25,0.0,95.0,190.0,180.0},
   }},
   ["suitcase"] = {"missheistdocksprep1hold_cellphone", "static", "Tenir une valise", AnimationOptions =
   {
       Prop = "prop_ld_suitcase_01",
       PropBone = 57005,
       PropPlacement = {0.39, 0.0, 0.0, 0.0, 266.0, 60.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["suitcase2"] = {"missheistdocksprep1hold_cellphone", "static", "Tenir une valise 2", AnimationOptions =
   {
       Prop = "prop_security_case_01",
       PropBone = 57005,
       PropPlacement = {0.10, 0.0, 0.0, 0.0, 280.0, 53.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["mugshot"] = {"mp_character_creation@customise@male_a", "loop", "Photo d'identité", AnimationOptions =
   {
       Prop = 'prop_police_id_board',
       PropBone = 58868,
       PropPlacement = {0.12, 0.24, 0.0, 5.0, 0.0, 70.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["coffee"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Tenir un café", AnimationOptions =
   {
       Prop = 'p_amb_coffeecup_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["whiskey"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Tenir un verre de whiskey", AnimationOptions =
   {
       Prop = 'prop_drink_whisky',
       PropBone = 28422,
       PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["beer"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Biére", AnimationOptions =
   {
       Prop = 'prop_amb_beer_bottle',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["cup"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Tenir une tasse", AnimationOptions =
   {
       Prop = 'prop_plastic_cup_02',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["donut"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Manger un donut", AnimationOptions =
   {
       Prop = 'prop_amb_donut',
       PropBone = 18905,
       PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
       EmoteMoving = true,
   }},
   ["burger"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Burger", AnimationOptions =
   {
       Prop = 'prop_cs_burger_01',
       PropBone = 18905,
       PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
       EmoteMoving = true,
   }},
   ["sandwich"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Manger un sandwich", AnimationOptions =
   {
       Prop = 'prop_sandwich_01',
       PropBone = 18905,
       PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
       EmoteMoving = true,
   }},
   ["soda"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Tenir une canette de soda", AnimationOptions =
   {
       Prop = 'prop_ecola_can',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["egobar"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Mager une bar de chocolat", AnimationOptions =
   {
       Prop = 'prop_choc_ego',
       PropBone = 60309,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteMoving = true,
   }},
   ["wine"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Tenir un verre de vin", AnimationOptions =
   {
       Prop = 'prop_drink_redwine',
       PropBone = 18905,
       PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["flute"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Tenir un verre de champagne vide", AnimationOptions =
   {
       Prop = 'prop_champ_flute',
       PropBone = 18905,
       PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["champagne"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Verre de champagne", AnimationOptions =
   {
       Prop = 'prop_drink_champ',
       PropBone = 18905,
       PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["cigar"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Fumer un cigar", AnimationOptions =
   {
       Prop = 'prop_cigar_02',
       PropBone = 47419,
       PropPlacement = {0.010, 0.0, 0.0, 50.0, 0.0, -80.0},
       EmoteMoving = true,
       EmoteDuration = 2600
   }},
   ["cigar2"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Fumer une cigar 2", AnimationOptions =
   {
       Prop = 'prop_cigar_01',
       PropBone = 47419,
       PropPlacement = {0.010, 0.0, 0.0, 50.0, 0.0, -80.0},
       EmoteMoving = true,
       EmoteDuration = 2600
   }},
   ["guitar"] = {"amb@world_human_musician@guitar@male@idle_a", "idle_b", "Jouer de la guitare", AnimationOptions =
   {
       Prop = 'prop_acc_guitar_01',
       PropBone = 24818,
       PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["guitar2"] = {"switch@trevor@guitar_beatdown", "001370_02_trvs_8_guitar_beatdown_idle_busker", "Jouer de la guitare en movement", AnimationOptions =
   {
       Prop = 'prop_acc_guitar_01',
       PropBone = 24818,
       PropPlacement = {-0.05, 0.31, 0.1, 0.0, 20.0, 150.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["guitarelectric"] = {"amb@world_human_musician@guitar@male@idle_a", "idle_b", "Jouer de la guitare éléctrique", AnimationOptions =
   {
       Prop = 'prop_el_guitar_01',
       PropBone = 24818,
       PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["guitarelectric2"] = {"amb@world_human_musician@guitar@male@idle_a", "idle_b", "Jouer de la guitare éléctrique 2", AnimationOptions =
   {
       Prop = 'prop_el_guitar_03',
       PropBone = 24818,
       PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["book"] = {"cellphone@", "cellphone_text_read_base", "Livre", AnimationOptions =
   {
       Prop = 'prop_novel_01',
       PropBone = 6286,
       PropPlacement = {0.15, 0.03, -0.065, 0.0, 180.0, 90.0}, -- This positioning isnt too great, was to much of a hassle
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["bouquet"] = {"impexp_int-0", "mp_m_waremech_01_dual-0", "Bouquet de fleur", AnimationOptions =
   {
       Prop = 'prop_snow_flower_02',
       PropBone = 24817,
       PropPlacement = {-0.29, 0.40, -0.02, -90.0, -90.0, 0.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["teddy"] = {"impexp_int-0", "mp_m_waremech_01_dual-0", "Tenir une péluche", AnimationOptions =
   {
       Prop = 'v_ilev_mr_rasberryclean',
       PropBone = 24817,
       PropPlacement = {-0.20, 0.46, -0.016, -180.0, -90.0, 0.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["backpack"] = {"move_p_m_zero_rucksack", "idle", "Sac à dos", AnimationOptions =
   {
       Prop = 'p_michael_backpack_s',
       PropBone = 24818,
       PropPlacement = {0.07, -0.11, -0.05, 0.0, 90.0, 175.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["clipboard"] = {"missfam4", "base", "Consulter un bloc note", AnimationOptions =
   {
       Prop = 'p_amb_clipboard_01',
       PropBone = 36029,
       PropPlacement = {0.16, 0.08, 0.1, -130.0, -50.0, 0.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["map"] = {"amb@world_human_tourist_map@male@base", "base", "Consulter une carte GPS", AnimationOptions =
   {
       Prop = 'prop_tourist_map_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["beg"] = {"amb@world_human_bum_freeway@male@base", "base", "Pancarte de SDF", AnimationOptions =
   {
       Prop = 'prop_beggers_sign_03',
       PropBone = 58868,
       PropPlacement = {0.19, 0.18, 0.0, 5.0, 0.0, 40.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["makeitrain"] = {"anim@mp_player_intupperraining_cash", "idle_a", "Faire pleuvoir des billets", AnimationOptions =
   {
       Prop = 'prop_anim_cash_pile_01',
       PropBone = 60309,
       PropPlacement = {0.0, 0.0, 0.0, 180.0, 0.0, 70.0},
       EmoteMoving = true,
       EmoteLoop = true,
       PtfxAsset = "scr_xs_celebration",
       PtfxName = "scr_xs_money_rain",
       PtfxPlacement = {0.0, 0.0, -0.09, -80.0, 0.0, 0.0, 1.0},
       PtfxInfo = Config.Languages[Config.MenuLanguage]['makeitrain'],
       PtfxWait = 5,
   }},
   ["camera"] = {"amb@world_human_paparazzi@male@base", "base", "Appareil photo", AnimationOptions =
   {
       Prop = 'prop_pap_camera_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
       PtfxAsset = "scr_bike_business",
       PtfxName = "scr_bike_cfid_camera_flash",
       PtfxPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0},
       PtfxInfo = Config.Languages[Config.MenuLanguage]['camera'],
       PtfxWait = 2,
   }},
   ["champagnespray"] = {"anim@mp_player_intupperspray_champagne", "idle_a", "Arroser de champagne", AnimationOptions =
   {
       Prop = 'ba_prop_battle_champ_open',
       PropBone = 28422,
       PropPlacement = {0.0,0.0,0.0,0.0,0.0,0.0},
       EmoteMoving = true,
       EmoteLoop = true,
       PtfxAsset = "scr_ba_club",
       PtfxName = "scr_ba_club_champagne_spray",
       PtfxPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       PtfxInfo = Config.Languages[Config.MenuLanguage]['spraychamp'],
       PtfxWait = 5,
   }},
   ["joint"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Fumer un joint", AnimationOptions =
   {
       Prop = 'p_cs_joint_02',
       PropBone = 47419,
       PropPlacement = {0.015, -0.009, 0.003, 55.0, 0.0, 110.0},
       EmoteMoving = true,
       EmoteDuration = 2600
   }},
   ["cig"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Fumer une cigarette", AnimationOptions =
   {
       Prop = 'prop_amb_ciggy_01',
       PropBone = 47419,
       PropPlacement = {0.015, -0.009, 0.003, 55.0, 0.0, 110.0},
       EmoteMoving = true,
       EmoteDuration = 2600
   }},
   ["brief3"] = {"missheistdocksprep1hold_cellphone", "static", "Malette à tenir", AnimationOptions =
   {
       Prop = "prop_ld_case_01",
       PropBone = 57005,
       PropPlacement = {0.10, 0.0, 0.0, 0.0, 280.0, 53.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["tablet"] = {"amb@world_human_tourist_map@male@base", "base", "Conssulter une tablette", AnimationOptions =
   {
       Prop = "prop_cs_tablet",
       PropBone = 28422,
       PropPlacement = {0.0, -0.03, 0.0, 20.0, -90.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["tablet2"] = {"amb@code_human_in_bus_passenger_idles@female@tablet@idle_a", "idle_a", "Conssulter une tablette 2", AnimationOptions =
   {
       Prop = "prop_cs_tablet",
       PropBone = 28422,
       PropPlacement = {-0.05, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["phonecall"] = {"cellphone@", "cellphone_call_listen_base", "Appeler quelqu'un", AnimationOptions =
   {
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["phone"] = {"cellphone@", "cellphone_text_read_base", "Regarder son téléphone", AnimationOptions =
   {
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["clean"] = {"timetable@floyd@clean_kitchen@base", "base", "Nettoyer une table", AnimationOptions =
   {
       Prop = "prop_sponge_01",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, -0.01, 90.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["clean2"] = {"amb@world_human_maid_clean@", "base", "Nettoyer une vitre", AnimationOptions =
   {
       Prop = "prop_sponge_01",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, -0.01, 90.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
}



































DP.Gestes = {
   ["adjust"] = {"missmic4", "michael_tux_fidget", "Ajustez sa chemise", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteDuration = 4000,
   }},
   ["argue"] = {"misscarsteal4@actor", "actor_berating_loop", "Disputer", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["argue2"] = {"oddjobs@assassinate@vice@hooker", "argue_a", "Toi là ! Je vais t'éclater !", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["boi"] = {"special_ped@jane@monologue_5@monologue_5c", "brotheradrianhasshown_2", "Faire des gestes de la main", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteDuration = 3000,
   }},
   ["clap"] = {"amb@world_human_cheering@male_a", "base", "Applaudir joyeusement", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["clapangry"] = {"anim@arena@celeb@flat@solo@no_props@", "angry_clap_a_player_a", "Applaudir comme un débile", AnimationOptions =
   {
       EmoteLoop = true,
   }},

   ["comeatmebro"] = {"mini@triathlon", "want_some_of_this", "C'est mon frère sa !", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2000
   }},
   ["cough"] = {"timetable@gardener@smoking_joint", "idle_cough", "Tousser", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["countdown"] = {"random@street_race", "grid_girl_race_start", "Applaudissement", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["cutthroat"] = {"anim@mp_player_intcelebrationmale@cut_throat", "cut_throat", "Toi là ! Je vais te crever !"},
   ["cutthroat2"] = {"anim@mp_player_intcelebrationfemale@cut_throat", "cut_throat", "Je vais te trancher la gorge"},
   ["damn"] = {"gestures@m@standing@casual", "gesture_damn", "Ah merde !", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000
   }},
   ["damn2"] = {"anim@am_hold_up@male", "shoplift_mid", "Put*** !", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000
   }},
   ["eat"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Manger", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000,
   }},
   ["facepalm"] = {"random@car_thief@agitated@idle_a", "agitated_idle_a", "Oh lala..", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 8000
   }},
   ["facepalm2"] = {"anim@mp_player_intcelebrationfemale@face_palm", "face_palm", "Hein ? Pas possible..", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 8000
   }},
   ["facepalm3"] = {"missminuteman_1ig_2", "tasered_2", "Quel malheur..", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 8000
   }},
   ["facepalm4"] = {"anim@mp_player_intupperface_palm", "idle_a", "Quel idiot..", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["finger"] = {"anim@mp_player_intselfiethe_bird", "idle_a", "Faire un fuck", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["finger2"] = {"anim@mp_player_intupperfinger", "idle_a_fp", "Faire un double fuck", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["flex"] = {"Scenario", "WORLD_HUMAN_MUSCLE_FLEX", "Montrer ses muscles"},
   ["flipoff"] = {"anim@arena@celeb@podium@no_prop@", "flip_off_a_1st", "Faire un fuck à l'horizon", AnimationOptions =
   {
       EmoteMoving = true,
   }},
   ["flipoff2"] = {"anim@arena@celeb@podium@no_prop@", "flip_off_c_1st", "Faire un double fuck à l'horizon", AnimationOptions =
   {
       EmoteMoving = true,
   }},
   ["gangsign"] = {"mp_player_int_uppergang_sign_a", "mp_player_int_gang_sign_a", "Signe de gang", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gangsign2"] = {"mp_player_int_uppergang_sign_b", "mp_player_int_gang_sign_b", "Signe de gang 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["handshake"] = {"mp_ped_interaction", "handshake_guy_a", "Poignée de main", "Tscheck moi sa", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000,
       SyncOffsetFront = 0.9
   }},
   ["handshake2"] = {"mp_ped_interaction", "handshake_guy_b", "Poignée de main 2", "Tscheck mon pote !", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000
   }},

   ["handsup"] = {"missminuteman_1ig_2", "handsup_base", "Lever les mains en l'air", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteLoop = true,
   }},
   ["headbutt"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_headbutt", "Coup de boule", "headbutted"},
   ["hug"] = {"mp_ped_interaction", "kisses_guy_a", "Serrer dans les bras", "Câlin", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 5000,
       SyncOffsetFront = 1.05,
   }},
   ["hug2"] = {"mp_ped_interaction", "kisses_guy_b", "Serrer dans les bras 2", "Câlin 2", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 5000,
       SyncOffsetFront = 1.13
   }},
   ["jazzhands"] = {"anim@mp_player_intcelebrationfemale@jazz_hands", "jazz_hands", "Clown", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 6000,
   }},
   ["keyfob"] = {"anim@mp_player_intmenu@key_fob@", "fob_click", "Utiliser une clée", AnimationOptions =
   {
       EmoteLoop = false,
       EmoteMoving = true,
       EmoteDuration = 1000,
   }},
   ["knock"] = {"timetable@jimmy@doorknock@", "knockdoor_idle", "Toquer à une porte", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["knock2"] = {"missheistfbi3b_ig7", "lift_fibagent_loop", "Toquer fort à une porte", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["knucklecrunch"] = {"anim@mp_player_intcelebrationfemale@knuckle_crunch", "knuckle_crunch", "Se craquer les doigts", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["leanside5"] = {"rcmjosh2", "josh_2_intp1_base", "S'aggriper à quelqu'un", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["lift"] = {"random@hitch_lift", "idle_f", "Faire du stop", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["me"] = {"gestures@f@standing@casual", "gesture_me_hard", "Moi ?", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000
   }},
   ["metal"] = {"anim@mp_player_intincarrockstd@ps@", "idle_a", "Signe métal", AnimationOptions = -- CHANGE ME
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["mindblown"] = {"anim@mp_player_intcelebrationmale@mind_blown", "mind_blown", "Ravi de te voir !", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 4000
   }},
   ["mindblown2"] = {"anim@mp_player_intcelebrationfemale@mind_blown", "mind_blown", "Damn", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 4000
   }},
   ["no"] = {"anim@heists@ornate_bank@chat_manager", "fail", "Non pas du tout !", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["no2"] = {"mp_player_int_upper_nod", "mp_player_int_nod_no", "Non de la tête", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["nosepick"] = {"anim@mp_player_intcelebrationfemale@nose_pick", "nose_pick", "Se décrotter le nez", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["noway"] = {"gestures@m@standing@casual", "gesture_no_way", "Absolument pas", AnimationOptions =
   {
       EmoteDuration = 1500,
       EmoteMoving = true,
   }},
   ["ok"] = {"anim@mp_player_intselfiedock", "idle_a", "OK", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["peace"] = {"mp_player_int_upperpeace_sign", "mp_player_int_peace_sign", "Peace and love", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["peace2"] = {"anim@mp_player_intupperpeace", "idle_a", "Peace and love 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["pickup"] = {"random@domestic", "pickup_low", "Ramasser"},
   ["point"] = {"gestures@f@standing@casual", "gesture_point", "Hé toi là !", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["pointdown"] = {"gestures@f@standing@casual", "gesture_hand_down", "Tu restes ici", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000
   }},
   ["pointright"] = {"mp_gun_shop_tut", "indicate_right", "Pointe vers la droite", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["pullover"] = {"misscarsteal3pullover", "pull_over_right", "Hé toi !", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1300,
   }},
   ["reaching"] = {"move_m@intimidation@cop@unarmed", "idle", "Main sur le holster", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["salute"] = {"anim@mp_player_intincarsalutestd@ds@", "idle_a", "Salut de l'armée", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["salute2"] = {"anim@mp_player_intincarsalutestd@ps@", "idle_a", "Salut de l'armée 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["salute3"] = {"anim@mp_player_intuppersalute", "idle_a", "Salut de l'armée 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["scared"] = {"random@domestic", "f_distressed_loop", "Avoir peur", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["scared2"] = {"random@homelandsecurity", "knees_loop_girl", "Avoir peur 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["screwyou"] = {"misscommon@response", "screw_you", "Bras d'honneur", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["shakeoff"] = {"move_m@_idles@shake_off", "shakeoff_1", "Enlever la poussière au sol", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3500,
   }},
   ["shrug"] = {"gestures@f@standing@casual", "gesture_shrug_hard", "Hein ?", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000,
   }},
   ["shrug2"] = {"gestures@m@standing@casual", "gesture_shrug_hard", "Quoi ?", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000,
   }},
   ["slap"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_slap", "Giffler quelqu'un", "slapped", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
       EmoteDuration = 2000,
   }},
   ["slowclap"] = {"anim@mp_player_intcelebrationfemale@slow_clap", "slow_clap", "Applaudir doucement", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["slowclap2"] = {"anim@mp_player_intcelebrationmale@slow_clap", "slow_clap", "Applaudir doucement 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["slowclap3"] = {"anim@mp_player_intupperslow_clap", "idle_a", "Applaudir au ralenti", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["smell"] = {"move_p_m_two_idles@generic", "fidget_sniff_fingers", "Se sentir la main", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["stink"] = {"anim@mp_player_intcelebrationfemale@stinker", "stinker", "Sa pue", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["think"] = {"misscarsteal4@aliens", "rehearsal_base_idle_director", "Hm..", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["think2"] = {"missheist_jewelleadinout", "jh_int_outro_loop_a", "Se tenir le menton", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["think3"] = {"timetable@tracy@ig_8@base", "base", "Se gratter l'oeil", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["think4"] = {"anim@amb@casino@hangout@ped_male@stand@02b@idles", "idle_a", "Croiser les bras en ce tenant le menton", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["think5"] = {"mp_cp_welcome_tutthink", "b_think", "Se gratter la tête", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2000,
   }},
   ["thumbsup"] = {"anim@mp_player_intupperthumbs_up", "idle_a", "Double pouce en l'air", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["thumbsup2"] = {"anim@mp_player_intselfiethumbs_up", "idle_a", "Pouce en l'air en souriant", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["thumbsup3"] = {"anim@mp_player_intincarthumbs_uplow@ds@", "enter", "Pouce en l'air", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000,
   }},
   ["wave"] = {"friends@frj@ig_1", "wave_a", "Coucou !", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wave2"] = {"anim@mp_player_intcelebrationfemale@wave", "wave", "Salut de reine", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wave3"] = {"friends@fra@ig_1", "over_here_idle_a", "Lever un bras comme une star", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wave4"] = {"random@mugging5", "001445_01_gangintimidation_1_female_idle_b", "Salut avec les bras en l'air", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000,
   }},
   ["wave5"] = {"friends@frj@ig_1", "wave_b", "Hé c'est moi !", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wave6"] = {"friends@frj@ig_1", "wave_c", "Je suis là", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wave7"] = {"friends@frj@ig_1", "wave_d", "Hé oh", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wave8"] = {"friends@frj@ig_1", "wave_e", "Salut !", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wave9"] = {"gestures@m@standing@casual", "gesture_hello", "Hey !", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},

   ["whistle"] = {"taxi_hail", "hail_taxi", "Sifflé", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1300,
   }},
   ["whistle2"] = {"rcmnigel1c", "hailing_whistle_waive_a", "Sifflé 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2000,
   }},
   ["yeah"] = {"anim@mp_player_intupperair_shagging", "idle_a", "Yeah", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
}

DP.Autres = {
   ["adjusttie"] = {"clothingtie", "try_tie_positive_a", "Se ré-habillez correctement", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 5000
   }},
   ["airplane"] = {"missfbi1", "ledge_loop", "Se prendre pour un avion", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["bark"] = {"random@peyote@dog", "wakeup", "Faire le chien par terre"},
   ["beast"] = {"anim@mp_fm_event@intro", "beast_transform", "Flou", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 5000,
   }},
   ["bird"] = {"random@peyote@bird", "wakeup", "Faire l'oiseau"},
   ["blowkiss"] = {"anim@mp_player_intcelebrationfemale@blow_kiss", "blow_kiss", "Plein de bisous"},
   ["blowkiss2"] = {"anim@mp_player_intselfieblow_kiss", "exit", "Embrasser", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2000

   }},
   ["bringiton"] = {"misscommon@response", "bring_it_on", "Qu'est-ce qu'y a", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000
   }},
   ["celebrate"] = {"rcmfanatic1celebrate", "celebrate", "Célébrer", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["chicken"] = {"random@peyote@chicken", "wakeup", "Faire la poule", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["clown"] = {"rcm_barry2", "clown_idle_0", "Clown", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["clown2"] = {"rcm_barry2", "clown_idle_1", "Clown 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["clown3"] = {"rcm_barry2", "clown_idle_2", "Clown 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["clown4"] = {"rcm_barry2", "clown_idle_3", "Clown 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["clown5"] = {"rcm_barry2", "clown_idle_6", "Clown 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["curtsy"] = {"anim@mp_player_intcelebrationpaired@f_f_sarcastic", "sarcastic_left", "Danseuse étoile"},
   ["dj"] = {"anim@amb@nightclub@djs@dixon@", "dixn_dance_cntr_open_dix", "DJ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["fishdance"] = {"anim@mp_player_intupperfind_the_fish", "idle_a", "Danse du poisson", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["lapdance2"] = {"mini@strip_club@private_dance@idle", "priv_dance_idle", "Dance privée", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["lapdance3"] = {"mini@strip_club@private_dance@part2", "priv_dance_p2", "Dance privée 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["lapdance3"] = {"mini@strip_club@private_dance@part3", "priv_dance_p3", "Dance privée 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["ledge"] = {"missfbi1", "ledge_loop", "Superman", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["lol"] = {"anim@arena@celeb@flat@paired@no_props@", "laugh_a_player_b", "Mort de rire", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["lol2"] = {"anim@arena@celeb@flat@solo@no_props@", "giggle_a_player_b", "Mort de rire 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["mindcontrol"] = {"rcmbarry", "mind_control_b_loop", "Contrôle de la pensée", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["mindcontrol2"] = {"rcmbarry", "bar_1_attack_idle_aln", "Contrôle de la pensée 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["namaste"] = {"timetable@amanda@ig_4", "ig_4_base", "Namaste", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["nervous"] = {"amb@world_human_bum_standing@twitchy@idle_a", "idle_c", "Méfiant", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["nervous2"] = {"mp_missheist_countrybank@nervous", "nervous_idle", "Méfiant 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["nervous3"] = {"rcmme_tracey1", "nervous_loop", "Méfiant 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["pee"] = {"misscarsteal2peeing", "peeing_loop", "faire pipi", AnimationOptions =
   {
       EmoteStuck = true,
       PtfxAsset = "scr_amb_chop",
       PtfxName = "ent_anim_dog_peeing",
       PtfxNoProp = true,
       PtfxPlacement = {-0.05, 0.3, 0.0, 0.0, 90.0, 90.0, 1.0},
       PtfxInfo = Config.Languages[Config.MenuLanguage]['pee'],
       PtfxWait = 30,
   }},
   ["peek"] = {"random@paparazzi@peek", "left_peek_a", "Pousser sur le côté", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["pull"] = {"random@mugging4", "struggle_loop_b_thief", "Tirer le maillot de quelqu'un", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["push"] = {"missfinale_c2ig_11", "pushcar_offcliff_f", "Pousser", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["push2"] = {"missfinale_c2ig_11", "pushcar_offcliff_m", "Pousser 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["rabbit"] = {"random@peyote@rabbit", "wakeup", "Faire le lapin"}, 
   ["radio"] = {"random@arrests", "generic_radio_chatter", "Radio", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["sit"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_idle_nowork", "S'asseoir", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sit2"] = {"rcm_barry3", "barry_3_sit_loop", "S'asseoir 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sit3"] = {"amb@world_human_picnic@male@idle_a", "idle_a", "S'asseoir 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sit4"] = {"amb@world_human_picnic@female@idle_a", "idle_a", "S'asseoir 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sit5"] = {"anim@heists@fleeca_bank@ig_7_jetski_owner", "owner_idle", "S'asseoir 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sit6"] = {"timetable@jimmy@mics3_ig_15@", "idle_a_jimmy", "S'asseoir 6", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sit7"] = {"anim@amb@nightclub@lazlow@lo_alone@", "lowalone_base_laz", "S'asseoir 7", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sit8"] = {"timetable@jimmy@mics3_ig_15@", "mics3_15_base_jimmy", "S'asseoir 8", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sit9"] = {"amb@world_human_stupor@male@idle_a", "idle_a", "S'asseoir 9", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitlean"] = {"timetable@tracy@ig_14@", "ig_14_base_tracy", "S'asseoir Timidement", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitsad"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_sleeping-noworkfemale", "S'asseoir Tristement", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitscared"] = {"anim@heists@ornate_bank@hostages@hit", "hit_loop_ped_b", "S'asseoir effrayé", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitscared2"] = {"anim@heists@ornate_bank@hostages@ped_c@", "flinch_loop", "S'asseoir effrayé 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitscared3"] = {"anim@heists@ornate_bank@hostages@ped_e@", "flinch_loop", "S'asseoir effrayé 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitdrunk"] = {"timetable@amanda@drunk@base", "base", "S'asseoir bourré", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitchair"] = {"ScenarioObject", "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", "S'asseoir sur une chaise"},
   ["sitchair2"] = {"timetable@ron@ig_5_p3", "ig_5_p3_base", "S'asseoir sur une chaise 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitchair3"] = {"timetable@reunited@ig_10", "base_amanda", "S'asseoir sur une chaise 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitchair4"] = {"timetable@ron@ig_3_couch", "base", "S'asseoir sur une chaise 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitchair5"] = {"timetable@jimmy@mics3_ig_15@", "mics3_15_base_tracy", "S'asseoir sur une chaise 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitchair6"] = {"timetable@maid@couch@", "base", "S'asseoir sur une chaise 6", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitchairside"] = {"timetable@ron@ron_ig_2_alt1", "ig_2_alt1_base", "S'asseoir sur une chaise de côté", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["spiderman"] = {"missexile3", "ex03_train_roof_idle", "Spiderman", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["stickup"] = {"random@countryside_gang_fight", "biker_02_stickup_loop", "Pointer avec son arme", "stickupscared", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["stumble"] = {"misscarsteal4@actor", "Gros mal de tête", "Trébucher", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["stunned"] = {"stungun@standing", "damage", "Électrocuté", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["superhero"] = {"rcmbarry", "base", "Super héro", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["superhero2"] = {"rcmbarry", "base", "Super héro 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["threaten"] = {"random@atmrobberygen", "b_atm_mugging", "Pointé une arme comme un gangster", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["tryclothes"] = {"mp_clothing@female@trousers", "try_trousers_neutral_a", "Se regarder dans le mirroir", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["tryclothes2"] = {"mp_clothing@female@shirt", "try_shirt_positive_a", "Se regarder dans le mirroir 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["tryclothes3"] = {"mp_clothing@female@shoes", "try_shoes_positive_a", "Se regarder dans le mirroir 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["twerk"] = {"switch@trevor@mocks_lapdance", "001443_01_trvs_28_idle_stripper", "Twerk", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["uncuff"] = {"mp_arresting", "a_uncuff", "Se gratter la main", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["windowshop"] = {"Scenario", "WORLD_HUMAN_WINDOW_SHOP_BROWSE", "Regarder un article à la vitrine"},
}

DP.Activites = {
   ["airguitar"] = {"anim@mp_player_intcelebrationfemale@air_guitar", "air_guitar", "Guitare dans le vent"},
   ["hammer"] = {"Scenario", "WORLD_HUMAN_HAMMERING", "Taper au marteau"},
   ["airsynth"] = {"anim@mp_player_intcelebrationfemale@air_synth", "air_synth", "Piano dans le vent"},
   ["atm"] = {"Scenario", "PROP_HUMAN_ATM", "ATM"},
   ["bbq"] = {"MaleScenario", "PROP_HUMAN_BBQ", "BBQ"},
   ["bow"] = {"anim@arena@celeb@podium@no_prop@", "regal_c_1st", "Merci de fin de spectacle", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["bow2"] = {"anim@arena@celeb@podium@no_prop@", "regal_a_1st", "Merci de fin de spectacle 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
    ["bumbin"] = {"Scenario", "PROP_HUMAN_BUM_BIN", "Fouiller une poubelle"},
	["cheer"] = {"Scenario", "WORLD_HUMAN_CHEERING", "Félicitation"},
	["copbeacon"] = {"MaleScenario", "WORLD_HUMAN_CAR_PARK_ATTENDANT", "Donnez des ordres d'attérissage"},
	["drink"] = {"mp_player_inteat@pnq", "loop", "Boire", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2500,
   }},
   ["fallover"] = {"random@drunk_driver_1", "drunk_fall_over", "Ivre à en tomber"},
   ["fallover2"] = {"mp_suicide", "pistol", "Se tirer une balle dans la tête"},
   ["fallover3"] = {"mp_suicide", "pill", "Prendre du poisson"},
   ["fallover4"] = {"friends@frf@ig_2", "knockout_plyr", "Se prendre une balle en pleine tête"},
   ["fallover5"] = {"anim@gangops@hostage@", "victim_fail", "Se prendre une droite"},
   ["filmshocking"] = {"Scenario", "WORLD_HUMAN_MOBILE_FILM_SHOCKING", "Filmer avec son téléphone"},
   ["hiking"] = {"move_m@hiking", "idle", "Tenir son sac", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["impatient"] = {"Scenario", "WORLD_HUMAN_STAND_IMPATIENT", "Impatient"},
   ["inspect"] = {"random@train_tracks", "idle_e", "Inspecter"},
   ["janitor"] = {"Scenario", "WORLD_HUMAN_JANITOR", "tenir un balai"},
   ["kneel"] = {"Scenario", "CODE_HUMAN_MEDIC_KNEEL", "Jetez un coup d'oeil"},
   ["lapdance"] = {"mp_safehouse", "lap_dance_girl", "Lapdance"},
   ["leafblower"] = {"MaleScenario", "WORLD_HUMAN_GARDENER_LEAF_BLOWER", "Souffleur de feuilles"},
   ["lookout"] = {"Scenario", "CODE_HUMAN_CROSS_ROAD_WAIT", "Attention"},
   ["maid"] = {"Scenario", "WORLD_HUMAN_MAID_CLEAN", "Essuyer une vitre"},
   ["mechanic"] = {"mini@repair", "fixing_a_ped", "Réparer un moteur", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["mechanic2"] = {"amb@world_human_vehicle_mechanic@male@base", "idle_a", "ZMechanic 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["mechanic3"] = {"anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", "Réparer l'avant du véhicule", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["mechanic4"] = {"anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", "Réparer un moteur 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["meditate"] = {"rcmcollect_paperleadinout@", "meditiate_idle", "Méditer", AnimationOptions = -- CHANGE ME
   {
       EmoteLoop = true,
   }},
   ["meditate2"] = {"rcmepsilonism3", "ep_3_rcm_marnie_meditating", "Méditer 2", AnimationOptions = -- CHANGE ME
   {
       EmoteLoop = true,
   }},
   ["meditate3"] = {"rcmepsilonism3", "base_loop", "Méditer 3", AnimationOptions = -- CHANGE ME
   {
       EmoteLoop = true,
   }},
   ["musician"] = {"MaleScenario", "WORLD_HUMAN_MUSICIAN", "Jouer un instrument musical"},
   ["notepad2"] = {"Scenario", "CODE_HUMAN_MEDIC_TIME_OF_DEATH", "Sortir son notepad"},
   ["parkingmeter"] = {"Scenario", "PROP_HUMAN_PARKING_METER", "Payer à la borne du parking"},
   ["party"] = {"Scenario", "WORLD_HUMAN_PARTYING", "Boire une bière en dansant"},
   ["petting"] = {"creatures@rottweiler@tricks@", "petting_franklin", "Jardinage", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["prosthigh"] = {"Scenario", "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS", "Prostituée classe"},
   ["prostlow"] = {"Scenario", "WORLD_HUMAN_PROSTITUTE_LOW_CLASS", "Prostituée bas de gamme"},
   ["puddle"] = {"Scenario", "WORLD_HUMAN_BUM_WASH", "Se nettoyer avec de l'eau"},
   ["record"] = {"Scenario", "WORLD_HUMAN_MOBILE_FILM_SHOCKING", "Filmer une scène"},
   ["smoke"] = {"Scenario", "WORLD_HUMAN_SMOKING", "Fumer une cigarette"},
   ["smokeweed"] = {"MaleScenario", "WORLD_HUMAN_DRUG_DEALER", "Fumer de la weed"},
   ["texting"] = {"Scenario", "WORLD_HUMAN_STAND_MOBILE", "Envoyer un message"},
   ["type"] = {"anim@heists@prison_heiststation@cop_reactions", "cop_b_idle", "Taper sur un clavier", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["type2"] = {"anim@heists@prison_heistig1_p1_guard_checks_bus", "loop", "Taper sur un clavier 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["type3"] = {"mp_prison_break", "hack_loop", "Taper sur un clavier 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["type4"] = {"mp_fbi_heist", "loop", "Taper sur un clavier 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["warmth"] = {"amb@world_human_stand_fire@male@idle_a", "idle_a", "Se chauffer les mains autour du feu", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wave"] = {"friends@frj@ig_1", "wave_a", "Agiter les bras en l'air", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["weld"] = {"Scenario", "WORLD_HUMAN_WELDING", "Outil de soudure"},
}

DP.Positions = {
   ["bartender"] = {"anim@amb@clubhouse@bar@drink@idle_a", "idle_a_bartender", "Les mains sur le comptoir", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["bumsleep"] = {"Scenario", "WORLD_HUMAN_BUM_SLUMPED", "Grose sieste"},
   ["chill"] = {"switch@trevor@scares_tramp", "trev_scares_tramp_idle_tramp", "Allongé relax", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["clipboard2"] = {"MaleScenario", "WORLD_HUMAN_CLIPBOARD", "Vérifier la liste"},
   ["cloudgaze"] = {"switch@trevor@annoys_sunbathers", "trev_annoys_sunbathers_loop_girl", "Allongé dos au sol", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["cloudgaze2"] = {"switch@trevor@annoys_sunbathers", "trev_annoys_sunbathers_loop_guy", "Allongé dos au sol détendu", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["cop"] = {"Scenario", "WORLD_HUMAN_COP_IDLES", "Les mains sur la ceinture"},
   ["cop2"] = {"anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop", "Flic bras croisé", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["cop3"] = {"amb@code_human_police_investigate@idle_a", "idle_b", "flic appel radio", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["crossarms"] = {"amb@world_human_hang_out_street@female_arms_crossed@idle_a", "idle_a", "Croiser les bras", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["crossarms2"] = {"amb@world_human_hang_out_street@male_c@idle_a", "idle_b", "Croiser les bras en s'expriment", AnimationOptions =
   {
       EmoteMoving = true,
   }},
   ["crossarms3"] = {"anim@heists@heist_corona@single_team", "single_team_loop_boss", "Croiser les bras d'un air sérieux", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["crossarms4"] = {"random@street_race", "_car_b_lookout", "Croiser les bras main visible", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["crossarms5"] = {"anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop", "Croiser les bras énervé", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["crossarms6"] = {"random@shop_gunstore", "_idle", "Croiser les bras pour danse russe", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["crossarmsside"] = {"rcmnigel1a_band_groupies", "base_m2", "Croiser les bras avec la tête sur le côté", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["fallasleep"] = {"mp_sleep", "sleep_loop", "Dormir debout", AnimationOptions =
   	{
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["foldarms"] = {"anim@amb@business@bgen@bgen_no_work@", "stand_phone_phoneputdown_idle_nowork", "Croisez les bras en mode videur", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["foldarms2"] = {"anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop", "Croisez les bras énervé 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["guard"] = {"Scenario", "WORLD_HUMAN_GUARD_STAND", "Pose de videur"},
   ["hangout"] = {"Scenario", "WORLD_HUMAN_HANG_OUT_STREET", "Attendre un client"},
   ["hug3"] = {"mp_ped_interaction", "hugs_guy_a", "Tsheck gangster"},

   ["idle"] = {"anim@heists@heist_corona@team_idles@male_a", "idle", "Se regarder dans le miroir", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle1"] = {"amb@world_human_hang_out_street@male_b@idle_a", "idle_b", "Se regarder dans le miroir 1"},
   ["idle2"] = {"friends@fra@ig_1", "base_idle", "Se regarder dans le miroir 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle3"] = {"mp_move@prostitute@m@french", "idle", "Se regarder dans le miroir 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["idle4"] = {"random@countrysiderobbery", "idle_a", "Se regarder dans le miroir 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle5"] = {"anim@heists@heist_corona@team_idles@female_a", "idle", "Se regarder dans le miroir 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle6"] = {"anim@heists@humane_labs@finale@strip_club", "ped_b_celebrate_loop", "Se regarder dans le miroir 6", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle7"] = {"anim@mp_celebration@idles@female", "celebration_idle_f_a", "Se regarder dans le miroir 7", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle8"] = {"anim@mp_corona_idles@female_b@idle_a", "idle_a", "Se regarder dans le miroir 8", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle9"] = {"anim@mp_corona_idles@male_c@idle_a", "idle_a", "Se regarder dans le miroir 9", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle10"] = {"anim@mp_corona_idles@male_d@idle_a", "idle_a", "Se regarder dans le miroir 10", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idledrunk"] = {"random@drunk_driver_1", "drunk_driver_stand_loop_dd1", "Bourré sur place", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idledrunk2"] = {"random@drunk_driver_1", "drunk_driver_stand_loop_dd2", "Bourré sur place 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idledrunk3"] = {"missarmenian2", "standing_idle_loop_drunk", "Bourré sur place 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},

   ["kneel2"] = {"rcmextreme3", "idle", "S'agenouiller", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["kneel3"] = {"amb@world_human_bum_wash@male@low@idle_a", "idle_a", "S'agenouiller avec le bras sur le genou", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["lean"] = {"Scenario", "WORLD_HUMAN_LEANING", "Attendre posé contre un mur"},
   ["lean2"] = {"amb@world_human_leaning@female@wall@back@hand_up@idle_a", "idle_a", "Poser sur le mur en fumant", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["lean3"] = {"amb@world_human_leaning@female@wall@back@holding_elbow@idle_a", "idle_a", "Poser sur le mur détendu", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["lean4"] = {"amb@world_human_leaning@male@wall@back@foot_up@idle_a", "idle_a", "Poser sur le mur mains croisés", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["lean5"] = {"amb@world_human_leaning@male@wall@back@hands_together@idle_b", "idle_b", "Lean 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["leanbar"] = {"Scenario", "PROP_HUMAN_BUM_SHOPPING_CART", "Attendre posé sur un bar"},
   ["leanbar2"] = {"amb@prop_human_bum_shopping_cart@male@idle_a", "idle_c", "S'appuyer sur un bar", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["leanbar3"] = {"anim@amb@nightclub@lazlow@ig1_vip@", "clubvip_base_laz", "S'appuyer sur un bar 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["leanbar4"] = {"anim@heists@prison_heist", "ped_b_loop_a", "S'appuyer sur un bar 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["leanflirt"] = {"random@street_race", "_car_a_flirt_girl", "Tenir ses genoux", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["leanhigh"] = {"anim@mp_ferris_wheel", "idle_a_player_one", "Pousser un caddie", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["leanhigh2"] = {"anim@mp_ferris_wheel", "idle_a_player_two", "Pousser un caddie 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["leanside"] = {"timetable@mime@01_gc", "idle_a", "S'accrocher sur le côtés", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["leanside2"] = {"misscarstealfinale", "packer_idle_1_trevor", "S'accrocher sur le côtés 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["leanside3"] = {"misscarstealfinalecar_5_ig_1", "waitloop_lamar", "S'accrocher sur le côtés 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["leanside4"] = {"misscarstealfinalecar_5_ig_1", "waitloop_lamar", "S'accrocher sur le côtés 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["prone"] = {"missfbi3_sniping", "prone_dave", "S'allonger à plat ventre", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sleep"] = {"timetable@tracy@sleep@", "idle_c", "Dormir", AnimationOptions =
   {
       EmoteLoop = true,
   }},

   ["sunbatheback"] = {"Scenario", "WORLD_HUMAN_SUNBATHE_BACK", "Prendre un bain de soleil"},
   ["surrender"] = {"random@arrests@busted", "idle_a", "Se rendre", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["statue"] = {"Scenario", "WORLD_HUMAN_HUMAN_STATUE", "Faire la statue"},
   ["statue2"] = {"fra_0_int-1", "cs_lamardavis_dual-1", "Faire la statue 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["statue3"] = {"club_intro2-0", "csb_englishdave_dual-0", "Faire la statue 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sunbathe"] = {"amb@world_human_sunbathe@male@back@base", "base", "Bronzer sur le dos", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sunbathe2"] = {"amb@world_human_sunbathe@female@back@base", "base", "Bronzer sur le dos", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sunbathe3"] = {"Scenario", "WORLD_HUMAN_SUNBATHE", " Bronzer sur le ventre"},
   ["t"] = {"missfam5_yoga", "a2_pose", "Faire le T", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["t2"] = {"mp_sleep", "bind_pose_180", "Faire le T 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["wait"] = {"random@shop_tattoo", "_idle_a", "Attendre", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait2"] = {"missbigscore2aig_3", "wait_for_van_c", "Attendre 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait3"] = {"amb@world_human_hang_out_street@female_hold_arm@idle_a", "idle_a", "Attendre 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["wait4"] = {"amb@world_human_hang_out_street@Female_arm_side@idle_a", "idle_a", "Attendre 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["wait5"] = {"missclothing", "idle_storeclerk", "Attendre 5", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait6"] = {"timetable@amanda@ig_2", "ig_2_base_amanda", "Attendre 6", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait7"] = {"rcmnigel1cnmt_1c", "base", "Attendre 7", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait8"] = {"rcmjosh1", "idle", "Attendre 8", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait9"] = {"rcmjosh2", "josh_2_intp1_base", "Attendre 9", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["waitt10"] = {"timetable@amanda@ig_3", "ig_3_base_tracy", "Attendre 10", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["waitt11"] = {"misshair_shop@hair_dressers", "keeper_base", "Attendre 11", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["waitt12"] = {"rcmjosh1", "idle", "Attendre 12", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["waitt13"] = {"rcmnigel1a", "base", "Attendre 13", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
}

DP.Sports = {
   ["boxing"] = {"anim@mp_player_intcelebrationmale@shadow_boxing", "shadow_boxing", "Entraînement de boxe", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 4000
   }},
   ["boxing2"] = {"anim@mp_player_intcelebrationfemale@shadow_boxing", "shadow_boxing", "Entraînement de boxe 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 4000
   }},
   ["chinup"] = {"Scenario", "PROP_HUMAN_MUSCLE_CHIN_UPS", "Faire des tractions"},
   ["fightme"] = {"anim@deathmatch_intros@unarmed", "intro_male_unarmed_c", "Se mettre en position de combat"},
   ["fightme2"] = {"anim@deathmatch_intros@unarmed", "intro_male_unarmed_e", "S'étirer avant un combat"},
   ["flip"] = {"anim@arena@celeb@flat@solo@no_props@", "flip_a_player_a", "Salto"},
   ["flip2"] = {"anim@arena@celeb@flat@solo@no_props@", "cap_a_player_a", "Demi salto"},
   ["golfswing"] = {"rcmnigel1d", "swing_a_mark", "Jouer au golf"},
   ["jog"] = {"Scenario", "WORLD_HUMAN_JOG_STANDING", "S'échauffer pour son jogging"},
   ["jog2"] = {"amb@world_human_jog_standing@male@idle_a", "idle_a", "Faire son jogging", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["jog3"] = {"amb@world_human_jog_standing@female@idle_a", "idle_a", "Faire son jogging étant heureux", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["jog4"] = {"amb@world_human_power_walker@female@idle_a", "idle_a", "Faire son jogging avec les bras tendu", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["jog5"] = {"move_m@joy@a", "walk", "Faire son jogging comme un robot", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["jumpingjacks"] = {"timetable@reunited@ig_2", "jimmy_getknocked", "Faire des sauts de sport", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["karate"] = {"anim@mp_player_intcelebrationfemale@karate_chops", "karate_chops", "Faire du karate"},
   ["karate2"] = {"anim@mp_player_intcelebrationmale@karate_chops", "karate_chops", "Faire du karate 2"},
   ["outofbreath"] = {"re@construction", "out_of_breath", "Fatigué après une course", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["punching"] = {"rcmextreme2", "loop_punching", "Tapé dans le ventre", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["pushup"] = {"amb@world_human_push_ups@male@idle_a", "idle_d", "Faire des pompes", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["situp"] = {"amb@world_human_sit_ups@male@idle_a", "idle_a", "Faire des abdos", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["slide"] = {"anim@arena@celeb@flat@solo@no_props@", "slide_a_player_a", "Glissade sur les genoux"},
   ["slide2"] = {"anim@arena@celeb@flat@solo@no_props@", "slide_b_player_a", "Glissade sur les genoux 2"},
   ["slide3"] = {"anim@arena@celeb@flat@solo@no_props@", "slide_c_player_a", "Glissade sur les genoux 3"},
   ["slugger"] = {"anim@arena@celeb@flat@solo@no_props@", "slugger_a_player_a", "Tir à la bate"},
   ["stretch"] = {"mini@triathlon", "idle_e", "S'échauffer en s'étirant", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["stretch2"] = {"mini@triathlon", "idle_f", "S'échauffer en s'étirant 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["stretch3"] = {"mini@triathlon", "idle_d", "S'échauffer en s'étirant 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["stretch4"] = {"rcmfanatic1maryann_stretchidle_b", "idle_e", "S'échauffer en s'étirant 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["yoga"] = {"Scenario", "WORLD_HUMAN_YOGA", "Faire du yoga"},
}

DP.Santes = {
   ["cpr"] = {"mini@cpr@char_a@cpr_str", "cpr_pumpchest", "Massage cardiaque au sol", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["cpr2"] = {"mini@cpr@char_a@cpr_str", "cpr_pumpchest", "Massage cardiaque sur une table", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["crawl"] = {"move_injured_ground", "front_loop", "Ramper au sol blessé", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["medic"] = {"Scenario", "CODE_HUMAN_MEDIC_TEND_TO_DEAD", "Médecin inspectant une personne"},
   ["medic2"] = {"amb@medic@standing@tendtodead@base", "base", "Médecin inspectant un blessé", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["passout"] = {"missarmenian2", "drunk_loop", "Perdre connaissance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["passout2"] = {"missarmenian2", "corpse_search_exit_ped", "Perdre connaissance 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["passout3"] = {"anim@gangops@morgue@table@", "body_search", "Perdre connaissance 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["passout4"] = {"mini@cpr@char_b@cpr_def", "cpr_pumpchest_idle", "Perdre connaissance 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["passout5"] = {"random@mugging4", "flee_backward_loop_shopkeeper", "Perdre connaissance 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["shot"] = {"random@dealgonewrong", "idle_a", "Blesser par balle au sol", AnimationOptions =
   {
       EmoteLoop = true,
   }},
}
