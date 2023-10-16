//::///////////////////////////////////////////////
//:: Action: Dice Broadcast Mode = Global
//:: A_DiceBroad_G.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the PC to Global Broadcast Mode (1).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 25, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();

    SetLocalInt(oPC, "DiceBagVolume", 1);
}
