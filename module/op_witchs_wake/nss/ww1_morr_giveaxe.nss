//::///////////////////////////////////////////////
//:: Witchwork 1: Morrius, Player Gives Witchbane
//:: WW1_Morr_GiveAxe.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Morrius takes Witchbane from the player and
     equips it.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 16, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oWitchbane = GetItemPossessedBy(oPC, "ww1_Witchbane");
    int iNth = 0;
    object oMorrius = GetObjectByTag("MorriusHelmsplitter", iNth);

    DestroyObject(oWitchbane);

    //Loop through all copies of Morrius and make them equip Witchbane.
    while (oMorrius != OBJECT_INVALID)
    {
        CreateItemOnObject("ww1_witchbane", oMorrius);
        AssignCommand(oMorrius, ActionEquipItem(oWitchbane, INVENTORY_SLOT_RIGHTHAND));
        iNth++;
        oMorrius = GetObjectByTag("MorriusHelmsplitter", iNth);
    }
}
