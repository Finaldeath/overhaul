//::///////////////////////////////////////////////
//:: Witchwork Conversation System: Success or Failure Condition
//:: WW_Abil_SuccFail.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Past attempts have failed.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 1, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sResult = GetLocalString(OBJECT_SELF, "sWW_AbilityResult");

    if (sResult != "")
    {
        return TRUE;
    }
    return FALSE;
}
