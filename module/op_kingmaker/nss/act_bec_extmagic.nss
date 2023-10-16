//::///////////////////////////////////////////////
//:: Beckett Bribes PC
//:: act_bec_extmagic
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
//mark SB not speaking to PC, give PC magic amulet and some xp
    object oPC = GetFirstPC();
    CreateItemOnObject("nw_it_mneck006",oPC);
    GiveXPToCreature(oPC,500);
    SetLocalInt(OBJECT_SELF,"OS_BECKET_MOOD",10);
}
