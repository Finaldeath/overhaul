//::///////////////////////////////////////////////
//:: Witchwork 1: Helga Einswater, take 50 gp
//:: WW1_Helga_50gp_A.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Helga takes 50 gp from the player.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 24, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();

    //Take the 50 gp. Don't destroy it (that way thieves can pickpocket it back)
    TakeGoldFromCreature(50, oPC);
}
