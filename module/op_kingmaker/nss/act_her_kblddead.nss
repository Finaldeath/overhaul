//::///////////////////////////////////////////////
//:: act_her_kblddead
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The Hermit rewards the PC for killing the thieving kobolds
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
//give 200 gold and 500 xp
//Can only be rewarded for this once. Close this thread once he is told.
    object oPC = GetFirstPC();
    GiveGoldToCreature(oPC,200);
    GiveXPToCreature(oPC,500);
    SetLocalInt(OBJECT_SELF,"OS_HERMIT_KOBOLD",10);
}
