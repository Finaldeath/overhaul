//::///////////////////////////////////////////////
//:: Witchwork 1: Angmar, Polish Axe Condition
//:: WW1_Ang_Axe_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has 100 gold and
     the rusted axe stolen from the Night Hag's
     cemetery.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 8, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oAxe = GetItemPossessedBy(oPC, "ww1_graveaxe");
    int iGold = GetGold(oPC);

    if (oAxe != OBJECT_INVALID &&
        iGold >= 100)
    {
        return TRUE;
    }
    return FALSE;
}
