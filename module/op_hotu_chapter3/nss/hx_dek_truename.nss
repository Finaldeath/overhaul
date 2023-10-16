//::///////////////////////////////////////////////
//:: Name hx_dek_truename
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Deekin's True name is known and she is a
     henchman.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oHench = GetNearestObjectByTag("x2_hen_deekin", oPC);
    int iName = GetLocalInt(GetModule(), "bKnower_DeekinNamed");

    if(iName == TRUE)
    {
        if(GetMaster(oHench) == oPC)
        {
            return TRUE;
        }
    }
    return FALSE;
}
