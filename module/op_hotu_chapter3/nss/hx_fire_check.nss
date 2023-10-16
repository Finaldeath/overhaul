//::///////////////////////////////////////////////
//:: Name hx_fire_check
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Checks to see if this fire was already started.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 15, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    object oPC = GetPCSpeaker();
    // Variable on the PC so we know what to do if they abort the dialogue.
    int iFire = GetLocalInt(oPC, "HX_PC_STARTED_FIRE");

    if(iFire == 1)
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}
