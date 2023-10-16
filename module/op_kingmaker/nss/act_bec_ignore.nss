//::///////////////////////////////////////////////
//:: Becket ignores the PC
//:: act_bec_ignore
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Beckett ignores the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
//give some xp and set SB to ignore PC
    object oPC = GetFirstPC();
    GiveXPToCreature(oPC,250);
    SetLocalInt(OBJECT_SELF,"OS_BECKET_MOOD",10);
}
