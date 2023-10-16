//::///////////////////////////////////////////////
//:: Name hx_slp_natroom_n
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Nathyrra is in area check.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    if(GetArea(GetObjectByTag("x2_hen_nathyra")) != GetArea(GetObjectByTag("H2_SleepingMan")))
    {
        return TRUE;
    }
    return FALSE;
}
