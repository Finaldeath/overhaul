//::///////////////////////////////////////////////
//:: The Knower of Names, Take Amulet (Action Script)
//:: H7a_Name_Amulet.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Take the Sensei's Amulet from the player.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 8, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    object oAmulet;

    // Brad Prince. Take the Ring as well.
    object oRing;
    oRing = GetItemPossessedBy(oPC, "hx_puzzle_ring");
    DestroyObject(oRing);

    //Loop through all PCs, destroying all iterations.
    while (oPC != OBJECT_INVALID)
    {
        oAmulet = GetItemPossessedBy(oPC, "H2_SenseiAmulet");
        DestroyObject(oAmulet);

        //Update Loop Variables
        oPC = GetNextPC();
    }
}
