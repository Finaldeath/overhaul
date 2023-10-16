//::///////////////////////////////////////////////
//:: Tavernkeeper, Open Store (Action Script)
//:: H2a_Tav_Store.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Opens the Tavernkeeper's store.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 6, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oStore = GetObjectByTag("TavernStore");
    OpenStore(oStore, oPC);
}
