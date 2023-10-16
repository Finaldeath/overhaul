//::///////////////////////////////////////////////
//:: Name x1_onunaquire
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Module On UnAquire event.

    Don't let the PC drop the TowerCrystal if they
    try.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: April 11/03
//:://////////////////////////////////////////////

void main()
{
   object oItem = GetModuleItemLost();
    if (GetTag(oItem) == "x1towercrystal")
    {
        object oPC = GetModuleItemLostBy();
        DestroyObject(oItem);
        CreateItemOnObject("x1towercrystal", oPC);
        FloatingTextStrRefOnCreature(40527, oPC, FALSE);
    }
}
