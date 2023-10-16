//::///////////////////////////////////////////////
//:: os_con_hascure
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if the PC can cure light wounds
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Dec 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    iResult = GetHasSpell(SPELL_CURE_LIGHT_WOUNDS,oPC)
        || GetHasSpell(SPELL_CURE_MINOR_WOUNDS,oPC)
        || GetHasSpell(SPELL_CURE_MODERATE_WOUNDS,oPC)
        || GetHasSpell(SPELL_CURE_SERIOUS_WOUNDS,oPC)
        || GetHasSpell(SPELL_CURE_CRITICAL_WOUNDS,oPC)
        || GetHasSpell(SPELL_HEAL,oPC);
    return iResult;
}
