//::///////////////////////////////////////////////
//:: Q3 (Ch2 Dracolich Suplot)
//:: Generic Do Once (Condition Script)
//:: Q3a_Do_Once.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     The NPC will only say this line once.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 27, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bDoOnce = GetLocalInt(OBJECT_SELF, "Q3_DoOnce");

    if (bDoOnce == FALSE)
    {
        SetLocalInt(OBJECT_SELF, "Q3_DoOnce", TRUE);
        return TRUE;
    }
    return FALSE;
}
