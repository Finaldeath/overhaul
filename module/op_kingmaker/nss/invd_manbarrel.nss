//::///////////////////////////////////////////////
//:: invd_manbarrel
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Notify the player that they are doing the
     right thing in the poison room.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
    object oItem = GetInventoryDisturbItem();
    object oPC = GetLastDisturbed();
    int iDoOnce = GetLocalInt(OBJECT_SELF, "invd_manbarrel");
    string sMSG = "The Poison Crystal fits easily into the device.";

    // Notify the player that the crystal they put in the barrel belongs there
    // but only do it once per barrel.
    if ((iDoOnce != TRUE) && (GetIsPC(oPC) == TRUE)
    && (GetTag(oItem) == "q3_poisoncrystal"))
    {
        SetLocalInt(OBJECT_SELF, "invd_manbarrel", TRUE);
        FloatingTextStringOnCreature(sMSG, oPC, FALSE);
    }
}
