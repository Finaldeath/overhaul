//::///////////////////////////////////////////////
//:: Buying a haunted house
//:: act_ser_givekey
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC buys the haunted house
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: September 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    CreateItemOnObject("q2c_itm_keyhaunt",oPC);
    TakeGoldFromCreature(2000,oPC);
    SetLocalInt(GetModule(), "OS_SERAH_HOMESOLD",20);
}
