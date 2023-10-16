//::///////////////////////////////////////////////
//:: Witchwork Conversation System: Success Condition
//:: WW_Abil_Success.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Past attempts have been successful.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 28, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sResult = GetLocalString(OBJECT_SELF, "sWW_AbilityResult");

    if (sResult == "Success")
    {
        return TRUE;
    }
    return FALSE;
}
