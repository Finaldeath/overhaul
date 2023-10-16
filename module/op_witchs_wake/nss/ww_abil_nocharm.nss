//::///////////////////////////////////////////////
//:: Witchwork Conversation System: No Charm Condition
//:: WW_Abil_NoCharm.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player is currently
    incapable of casting either the "Charm Person"
    or "Charm Person or Animal" spell.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 1, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    string sResult = GetLocalString(OBJECT_SELF, "sWW_AbilityResult");
    int bHasSpell1 = GetHasSpell(SPELL_CHARM_PERSON, oPC);
    int bHasSpell2 = GetHasSpell(SPELL_CHARM_PERSON_OR_ANIMAL, oPC);

    if (sResult == "")
    {
        if (bHasSpell1 == FALSE &&
            bHasSpell2 == FALSE)
        {
            return TRUE;
        }
        return FALSE;
    }
    return FALSE;
}
