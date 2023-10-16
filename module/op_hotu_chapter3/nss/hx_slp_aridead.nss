//::///////////////////////////////////////////////
//:: Name hx_slp_aridead
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check to see if Aribeth is dead.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oAribeth = GetObjectByTag("H2_Aribeth");

    if(!GetIsObjectValid(oAribeth) || GetIsDead(oAribeth))
    {
        return TRUE;
    }
    return FALSE;
}
