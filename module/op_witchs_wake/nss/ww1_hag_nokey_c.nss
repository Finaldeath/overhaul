//::///////////////////////////////////////////////
//:: Witchwork I: Night Hag, No Key condition
//:: WW1_Hag_NoKey_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player does not already
     own a copy of the cemetery key.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 17, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oKey = GetItemPossessedBy(oPC, "ww1_cemeterykey");

    if (oKey == OBJECT_INVALID)
    {
        return TRUE;
    }
    return FALSE;
}
