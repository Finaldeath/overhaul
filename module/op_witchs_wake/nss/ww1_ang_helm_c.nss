//::///////////////////////////////////////////////
//:: Witchwork 1: Angmar, Polish Helm Condition
//:: WW1_Ang_Helm_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has 100 gold and
     the rusted helm stolen from the Night Hag's
     cemetery.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 8, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oHelm = GetItemPossessedBy(oPC, "ww1_gravehelm");
    int iGold = GetGold(oPC);

    if (oHelm != OBJECT_INVALID &&
        iGold >= 100)
    {
        return TRUE;
    }
    return FALSE;
}
