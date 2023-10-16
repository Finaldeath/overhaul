//::///////////////////////////////////////////////
//:: Default: On User Defined
//:: NW_C2_DEFAULTD
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Determines the course of action to be taken
    on a user defined event.
*/
//:://////////////////////////////////////////////
//:: Created By: Don Moar
//:: Created On: April 28, 2002
//:://////////////////////////////////////////////

void Revive()
{
    SetCommandable(TRUE);
    effect eHeal = EffectHeal(GetMaxHitPoints());
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, OBJECT_SELF);
    SetLocalInt(OBJECT_SELF, "DEAD", 0);
}

void main()
{
    // enter desired behaviour here
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == EVENT_DAMAGED)
    {
        int nDead = GetLocalInt(OBJECT_SELF, "DEAD");
        if(GetImmortal() == TRUE && GetCurrentHitPoints() == 1 && nDead == 0)
        {
            // Feign death for 30 seconds
            SetLocalInt(OBJECT_SELF, "DEAD", 1);
            ClearAllActions();
            ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 1.0, 30.0);
            SetCommandable(FALSE);
            DelayCommand(30.0, Revive());

        }
    }
    else if(nEvent == EVENT_END_COMBAT_ROUND)
    {
        if(GetTag(OBJECT_SELF) == "Q1_KATRIANA")
            return;
        int nRand = Random(4);
        if(nRand == 3)
            SpeakOneLinerConversation("q1_half_combat"); // 25% chance of showing lines

    }
    else if(nEvent == EVENT_SPELL_CAST_AT)
    {
        int nSpell = GetLastSpell();
        if(nSpell == SPELL_HEAL ||
           nSpell == SPELL_HEALING_CIRCLE ||
           nSpell == SPELL_MASS_HEAL ||
           nSpell == SPELL_CURE_CRITICAL_WOUNDS ||
           nSpell == SPELL_CURE_LIGHT_WOUNDS ||
           nSpell == SPELL_CURE_MINOR_WOUNDS ||
           nSpell == SPELL_CURE_MODERATE_WOUNDS ||
           nSpell == SPELL_CURE_SERIOUS_WOUNDS)
           {
                SpeakOneLinerConversation("q1_half_healed", GetLastSpellCaster());
           }
    }
    else if(nEvent == EVENT_HEARTBEAT)
    {
        // Removed because might cause Katriana to follow player outside of camp
        /*object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        if(GetTag(OBJECT_SELF) == "Q1_KATRIANA")
        {
            if(!IsInConversation(OBJECT_SELF) && GetLocalObject(GetArea(OBJECT_SELF), "Q1_CUTSCENE_PC") == OBJECT_INVALID)
            {
                object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
                ActionStartConversation(oPC);
            }
        }*/

        return;
        // talk to player if has not talked yet

    }
    else if(nEvent == 101) // revive
    {
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        ClearAllActions();
        ActionForceMoveToObject(oPC, TRUE, 2.0, 2.0);
        Revive();
    }
    return;

}
