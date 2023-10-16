//::///////////////////////////////////////////////
//:: Githzerai Sensei, First Time Talked To (Condition Script)
//:: H2c_Sens_NoTalk.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the NPC has not spoken this
     line before.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bTalked = GetLocalInt(OBJECT_SELF, "bTalked");

    if (bTalked == FALSE)
    {
        SetLocalInt(OBJECT_SELF, "bTalked", TRUE);
        return TRUE;
    }
    return FALSE;
}
