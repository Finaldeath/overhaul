//::///////////////////////////////////////////////
//:: Action: Dice Broadcast Mode = Local
//:: A_DiceBroad_L.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the PC to Local Broadcast Mode (0). This
    is the default mode.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 25, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();

    SetLocalInt(oPC, "DiceBagVolume", 0);
}
