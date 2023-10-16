//::///////////////////////////////////////////////
//:: Name hx_slp_sendead2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check to see if Sensei is gone.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oSensei = GetObjectByTag("H2_Sensei");

    if(!GetIsObjectValid(oSensei))
    {
        return TRUE;
    }
    return FALSE;
}
