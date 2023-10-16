//::///////////////////////////////////////////////
//:: Q3 (Ch2 Dracolich Suplot)
//:: Vix'thra is Alive (Condition Script)
//:: Q3c_VixLive.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Vix'thra is still alive.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 27, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bVixthraDead = GetLocalInt(GetModule(), "Q3_DRACOLICH_DEAD");

    if (bVixthraDead == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
