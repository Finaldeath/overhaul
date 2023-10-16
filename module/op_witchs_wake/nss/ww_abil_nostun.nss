//::///////////////////////////////////////////////
//:: Witchwork Conversation System: No Rage Condition
//:: WW_Abil_NoRage.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player is currently
    incapable of using the Barbarian Rage feat.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 28, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    string sResult = GetLocalString(OBJECT_SELF, "sWW_AbilityResult");
    int bHasStun = GetHasFeat(FEAT_STUNNING_FIST, oPC);

    if (sResult == "")
    {
        if (bHasStun == FALSE)
        {
            return TRUE;
        }
        return FALSE;
    }
    return FALSE;
}
