//::///////////////////////////////////////////////
//:: Action: Dice Broadcast Mode = Private
//:: A_DiceBroad_P.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the PC to Private Broadcast Mode (2).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 25, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();

    SetLocalInt(oPC, "DiceBagVolume", 2);
}
