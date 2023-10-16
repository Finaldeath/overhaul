//::///////////////////////////////////////////////
//:: Ashtara the Asabi Merchant (Action - Give Key)
//:: A_Ashtara_Key.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Give the player the key that allows them to
     leave the Asabi Camp.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 24, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    CreateItemOnObject("scarabkey", oPC);
    SetLocalInt(OBJECT_SELF, "bGaveKey", TRUE);
}
