//::///////////////////////////////////////////////
//:: Name hx_val_truename
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Valen's True name is known and she is a
     henchman.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oHench = GetNearestObjectByTag("x2_hen_valen", oPC);
    int iName = GetLocalInt(GetModule(), "bKnower_ValenNamed");

    if(iName == TRUE)
    {
        if(GetMaster(oHench) == oPC)
        {
            return TRUE;
        }
    }
    return FALSE;
}
