//::///////////////////////////////////////////////
//:: Name hx_slp_natdead
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check to see if Nathyrra is dead.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oNathyrra = GetObjectByTag("x2_hen_nathyra");

    if(!GetIsObjectValid(oNathyrra) || GetIsDead(oNathyrra))
    {
        return TRUE;
    }
    return FALSE;
}
