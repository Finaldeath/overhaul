//::///////////////////////////////////////////////
//:: Witchwork Conversation System: No Hold Person Condition
//:: WW_Abil_NoHold.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player is currently
    incapable of casting the Hold Person spell.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 1, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    string sResult = GetLocalString(OBJECT_SELF, "sWW_AbilityResult");
    int bHasSpell = GetHasSpell(SPELL_HOLD_PERSON, oPC);

    if (sResult == "")
    {
        if (bHasSpell == FALSE)
        {
            return TRUE;
        }
        return FALSE;
    }
    return FALSE;
}
