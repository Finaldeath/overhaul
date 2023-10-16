//::///////////////////////////////////////////////
//:: Witchwork 1: Memorial, No Chisel
//:: WW1_Mem_NoChisel.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if you don't have the chisel
     required to carve the memorial.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 18, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oChisel = GetItemPossessedBy(oPC, "ww1_chisel");

    if (oChisel == OBJECT_INVALID)
    {
        return TRUE;
    }
    return FALSE;
}
