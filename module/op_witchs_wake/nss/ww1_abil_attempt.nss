//::///////////////////////////////////////////////
//:: Witchwork Conversation System: Success/Failure Condition
//:: WW1_Abil_Attempt.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE only if a past attempt has not
     yet been made. Used by the Ragpicker in WW1
     to prevent an infinite XP loop.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 28, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sResult = GetLocalString(OBJECT_SELF, "sWW_AbilityResult");

    if (sResult == "")
    {
        return TRUE;
    }
    return FALSE;
}
