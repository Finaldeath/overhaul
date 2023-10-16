//::///////////////////////////////////////////////
//:: Durnan, Do Once (Condition Script)
//:: H9c_Durn_DoOnce.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if this line has not been spoken
     before.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 9, 2003
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
