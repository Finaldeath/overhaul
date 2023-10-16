//::///////////////////////////////////////////////
//:: Witchwork Conversation System: No Flirt Condition
//:: WW_Abil_NoFlirt.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player is the wrong gender
    to Flirt with this NPC.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 28, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    string sResult = GetLocalString(OBJECT_SELF, "sWW_AbilityResult");
    int iPCGender = GetGender(oPC);
    int iNPCGender = GetGender(OBJECT_SELF);

    if (sResult == "")
    {
        if (iPCGender == iNPCGender)
        {
            return TRUE;
        }
        return FALSE;
    }
    return FALSE;
}
