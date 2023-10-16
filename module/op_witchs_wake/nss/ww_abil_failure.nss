//::///////////////////////////////////////////////
//:: Witchwork Conversation System: Failure Condition
//:: WW_Abil_Failure.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Past attempts have failed.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 28, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sResult = GetLocalString(OBJECT_SELF, "sWW_AbilityResult");

    if (sResult == "Failure")
    {
        return TRUE;
    }
    return FALSE;
}
