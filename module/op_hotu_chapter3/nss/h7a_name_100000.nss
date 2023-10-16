//::///////////////////////////////////////////////
//:: The Knower of Names, Take 100,000 gold (Action Script)
//:: H7a_Name_100000.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Take 100,000 gold from the player.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 8, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    TakeGoldFromCreature(100000, oPC, TRUE);
}
