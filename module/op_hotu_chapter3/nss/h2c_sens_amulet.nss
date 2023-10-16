//::///////////////////////////////////////////////
//:: Githzerai Sensei, Player Has Amulet (Condition Script)
//:: H2c_Sens_Amulet.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player carries the
     Sensei's amulet.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oAmulet = GetItemPossessedBy(oPC, "H2_SenseiAmulet");

    if (oAmulet != OBJECT_INVALID)
    {
        return TRUE;
    }
    return FALSE;
}
