//::///////////////////////////////////////////////
//:: Witchwork 1: Angmar, Polish Sword Condition
//:: WW1_Ang_Sword_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has 100 gold and
     at least one of the rusted swords stolen from
     the Night Hag's cemetery.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 8, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oSword = GetItemPossessedBy(oPC, "ww1_gravesword");
    int iGold = GetGold(oPC);

    if (oSword != OBJECT_INVALID &&
        iGold >= 100)
    {
        return TRUE;
    }
    return FALSE;
}
