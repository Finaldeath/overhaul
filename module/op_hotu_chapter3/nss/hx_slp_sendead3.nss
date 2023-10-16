//::///////////////////////////////////////////////
//:: Name hx_slp_sendead3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check to see if Sensei is really dead (corpse in
     area).
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oSensei = GetObjectByTag("H2_Sensei");

    if(GetIsDead(oSensei))
    {
        return TRUE;
    }
    return FALSE;
}
