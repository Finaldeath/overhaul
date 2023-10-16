//::///////////////////////////////////////////////
//:: The Knower of Names, Take 500,000 gold (Action Script)
//:: H7a_Name_500000.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Take 500,000 gold from the player.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 8, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    TakeGoldFromCreature(500000, oPC, TRUE);
}
