//::///////////////////////////////////////////////
//:: Beckett Plots Against PC
//:: act_bec_ambush
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Beckett plots to Ambush the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
//set ambush on for end caves, set SB ignores pc, give xp, give good alignment shift
    object oPC = GetFirstPC();
    SetLocalInt(OBJECT_SELF,"OS_BECKET_AMBUSH",10);
    SetLocalInt(OBJECT_SELF,"OS_BECKET_MOOD",10);
    GiveXPToCreature(oPC,600);
    AdjustAlignment(oPC,ALIGNMENT_GOOD,15);
}
