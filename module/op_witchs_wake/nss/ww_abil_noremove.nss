//::///////////////////////////////////////////////
//:: Witchwork Conversation System: No Remove Fear Condition
//:: WW_Abil_NoRemove.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player is currently
    incapable of casting the Remove Fear spell.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 1, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    string sResult = GetLocalString(OBJECT_SELF, "sWW_AbilityResult");
    int bHasSpell = GetHasSpell(SPELL_REMOVE_FEAR, oPC);

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
