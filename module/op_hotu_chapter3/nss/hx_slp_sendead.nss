//::///////////////////////////////////////////////
//:: Name hx_slp_sendead
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check to see if Sensei is dead.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oSensei = GetObjectByTag("H2_Sensei");

    if(oSensei == OBJECT_INVALID || GetIsDead(oSensei) == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
