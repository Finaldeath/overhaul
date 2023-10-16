//::///////////////////////////////////////////////
//:: Default: End of Combat Round
//:: NW_C2_DEFAULT3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Morag randomly jumps around as well
*/
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"
void dbSpeak(string sTemp)
{
//    SpeakString(sTemp);
}
void main()
{
//    DetermineCombatRound();


        object oCoccoon = GetObjectByTag("m4sac2");
        if (GetIsObjectValid(oCoccoon) == TRUE)
        {
            ClearAllActions();
            PlayVoiceChat(VOICE_CHAT_TAUNT);
            ActionCastFakeSpellAtLocation(SPELL_FIREBALL, GetLocation(oCoccoon));
            DelayCommand(2.0,ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectDamage(100), oCoccoon));
        }

// *
//  * Spell Casting Subroutine Override for certain Morag Spells

    if (GetHasSpell(SPELL_FLAME_ARROW) == TRUE)
    {
        dbSpeak("flame arrow");
        ClearAllActions();
        ActionCastSpellAtObject(SPELL_FLAME_ARROW, GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC), METAMAGIC_ANY);
    }
    else
    if (GetHasSpell(SPELL_CHAIN_LIGHTNING) == TRUE)
    {
        dbSpeak("chain lightning");
        ClearAllActions();
        ActionCastSpellAtObject(SPELL_CHAIN_LIGHTNING, GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC), METAMAGIC_ANY);
    }
    else
    if (GetHasSpell(SPELL_CONE_OF_COLD) == TRUE)
    {
        ClearAllActions();
        ActionCastSpellAtObject(SPELL_CONE_OF_COLD, GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC), METAMAGIC_ANY);
    }
    else
    if (GetHasSpell(SPELL_LIGHTNING_BOLT) == TRUE)
    {
        ClearAllActions();
        ActionCastSpellAtObject(SPELL_LIGHTNING_BOLT, GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC), METAMAGIC_ANY);
    }

    // * Infinite Spell cast cheat if not in melee mode
    if (GetLocalInt(GetModule(), "NW_L_MELEEMODE") == 0)
    {
        ClearAllActions();
        int nRandom = Random(10) + 1;
        object oTarget = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        switch (nRandom)
        {
            case 1: case 2: case 3: ActionCastSpellAtObject(SPELL_LIGHTNING_BOLT, oTarget, METAMAGIC_ANY, TRUE); break;
            case 4: ActionCastSpellAtObject(SPELL_ENERVATION, oTarget, METAMAGIC_ANY, TRUE); break;
            case 5: case 6: case 7: ActionCastSpellAtObject(SPELL_FLAME_ARROW, oTarget, METAMAGIC_ANY, TRUE); break;
            case 8: case 9: ActionCastSpellAtObject(SPELL_MORDENKAINENS_DISJUNCTION, oTarget, METAMAGIC_ANY, TRUE); break;
            case 10: ActionCastSpellAtObject(SPELL_HORRID_WILTING, oTarget, METAMAGIC_ANY, TRUE); break;
        }
    }

// *
// * If Morag in Melee Mode then now have a chance to
// * summon the BIG Monsters
// *
    if (GetLocalInt(GetModule(), "NW_L_MELEEMODE") == 10)
    {
        if (GetLocalInt(OBJECT_SELF, "NW_L_TIMESTOP") == 0)
        {
            ClearAllActions();
            ActionCastSpellAtObject(SPELL_TIME_STOP, OBJECT_SELF, METAMAGIC_QUICKEN, TRUE);
            SetLocalInt(OBJECT_SELF, "NW_L_TIMESTOP", 1);
        }
        else
        if ( (GetLocalInt(OBJECT_SELF, "NW_L_TIMESTOP") == 1) && (Random(100) < 15))
        {
            ClearAllActions();
            ActionCastSpellAtObject(SPELL_TIME_STOP, OBJECT_SELF, METAMAGIC_QUICKEN, TRUE);
            SetLocalInt(OBJECT_SELF, "NW_L_TIMESTOP", 5);
            ActionCastSpellAtObject(SPELL_TENSERS_TRANSFORMATION, OBJECT_SELF, METAMAGIC_QUICKEN, TRUE);
        }
        else
        if (Random(100) < 25)
        {
            oCoccoon = GetObjectByTag("m4sac3");
            if (GetIsObjectValid(oCoccoon) == TRUE)
            {
                ClearAllActions();
                PlayVoiceChat(VOICE_CHAT_TAUNT);
                ActionCastFakeSpellAtLocation(SPELL_FIREBALL, GetLocation(oCoccoon));
                DelayCommand(2.0,ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectDamage(100), oCoccoon));
            }
        }
        else
        if (Random(100) < 25)
        {
            oCoccoon = GetObjectByTag("m4sac4");
            if (GetIsObjectValid(oCoccoon) == TRUE)
            {
                ClearAllActions();
                PlayVoiceChat(VOICE_CHAT_TAUNT);
                ActionCastFakeSpellAtLocation(SPELL_FIREBALL, GetLocation(oCoccoon));
                DelayCommand(2.0,ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectDamage(100), oCoccoon));
            }
        }
        else
            DetermineCombatRound();

    }
}


