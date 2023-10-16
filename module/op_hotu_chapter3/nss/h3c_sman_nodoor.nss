//::///////////////////////////////////////////////
//:: Sleeping Man, Door Not Yet Spawned In(Condition Script)
//:: H3c_SMan_NoDoor.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Sleeping Man has not
     yet spawned in the door to the Chamber of the
     Ring
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 16, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oDoor = GetObjectByTag("hx_sleep_2_ring");
    if(oDoor == OBJECT_INVALID)
    {
        return TRUE;
    }
    return FALSE;
}
