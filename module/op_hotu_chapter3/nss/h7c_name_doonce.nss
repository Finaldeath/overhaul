//::///////////////////////////////////////////////
//:: The Knower of Names, Do Once (Condition Script)
//:: H7c_Name_DoOnce.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the NPC has not spoken this
     line before.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 5, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bDoOnce = GetLocalInt(OBJECT_SELF, "bDoOnce");
    if (bDoOnce == FALSE)
    {
        SetLocalInt(OBJECT_SELF, "bDoOnce", TRUE);
        return TRUE;
    }
    return FALSE;
}
