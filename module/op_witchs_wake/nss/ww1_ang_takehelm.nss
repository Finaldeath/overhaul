//::///////////////////////////////////////////////
//:: Witchwork 1: Angmar, Take Helm
//:: WW1_Ang_TakeHelm.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Angmar takes 100 gp and the rusted helm from
     the player.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 8, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oHelm = GetItemPossessedBy(oPC, "ww1_gravehelm");
    object oHammer = GetItemPossessedBy(OBJECT_SELF, "NW_WBLHW001");

    //Take 100 gp. Leave it in his inventory for pickpockets.
    TakeGoldFromCreature(100, oPC);

    //Take helm.
    ActionTakeItem(oHelm, oPC);

    //Have him unequip his hammer.
    ActionUnequipItem(oHammer);
}
