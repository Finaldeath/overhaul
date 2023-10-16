//::///////////////////////////////////////////////
//:: act_her_kbldtrea
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The hermit rewards the PC for telling him about the Kobold honey thieves
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
//give pc 200 gold, the club of the hermit q1_hermitclub, 500 exp and close this thread.
    object oPC = GetFirstPC();
    GiveGoldToCreature(oPC,200);
    CreateItemOnObject("q1_hermitclub",oPC);
    GiveXPToCreature(oPC,500);
    SetLocalInt(OBJECT_SELF,"OS_HERMIT_KOBOLD",10);
}
