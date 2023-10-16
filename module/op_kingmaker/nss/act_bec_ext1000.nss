//::///////////////////////////////////////////////
//:: Beckett Bribes PC
//:: act_bec_ext1000
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Beckett bribes the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
//mark SB not speaking to PC, give PC 1000 gold and some xp
    object oPC = GetFirstPC();
    GiveGoldToCreature(oPC,1000);
    GiveXPToCreature(oPC,500);
    SetLocalInt(OBJECT_SELF,"OS_BECKET_MOOD",10);
}
