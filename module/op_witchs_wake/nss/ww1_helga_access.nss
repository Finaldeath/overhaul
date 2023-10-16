//::///////////////////////////////////////////////
//:: Witch Wake 1: Helga, Exhibits Access
//:: WW1_Helga_Access.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags the player as having Exhibits Access
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 9, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "CONV_HELGA_Access", TRUE);
}
