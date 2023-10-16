//::///////////////////////////////////////////////
//:: Name hx_slp_ariroom_n
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Aribeth is in area check.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    if(GetArea(GetObjectByTag("H2_Aribeth")) != GetArea(GetObjectByTag("H2_SleepingMan")))
    {
        return TRUE;
    }
    return FALSE;
}
