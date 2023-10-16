//::///////////////////////////////////////////////
//:: Name hx_slp_arifrozen
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check for a frozen Aribeth.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oAribeth = GetObjectByTag("H2_Aribeth");

    int bThawed = GetLocalInt(oAribeth, "bThawed");
    int iFrozen = GetLocalInt(oAribeth, "HX_FROZEN");

    if (bThawed == FALSE || iFrozen == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
