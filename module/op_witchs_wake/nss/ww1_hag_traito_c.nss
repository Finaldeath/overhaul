//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag's Tarot, Traitor Condition
//:: WW1_Hag_Traito_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Witch's Hand local is
     set to 1 and the player has the Iron Ring.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 9, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iWitchsHand = GetLocalInt(oPC, "iWitchsHand");
    object oIronRing = GetItemPossessedBy(oPC, "ww1_ironring");

    if (iWitchsHand == 1 &&
        oIronRing != OBJECT_INVALID)
    {
        return TRUE;
    }
    return FALSE;
}
