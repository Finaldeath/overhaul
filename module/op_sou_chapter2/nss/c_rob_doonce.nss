//::///////////////////////////////////////////////
//:: Rob the Skeleton (Condition - Do Once)
//:: C_Rob_DoOnce.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if this is the first time Rob
     has spoken.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: May 6, 2003
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
