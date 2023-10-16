//::///////////////////////////////////////////////
//:: Scrivener, I am a Follower (Condition Script)
//:: H2c_Scrv_Follow.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Scrivener is a Follower.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 6, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oMaster = GetMaster();
    if (oMaster != OBJECT_INVALID)
    {
        return TRUE;
    }
    return FALSE;
}
