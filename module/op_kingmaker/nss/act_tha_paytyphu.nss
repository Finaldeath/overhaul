//::///////////////////////////////////////////////
//:: Pay for Typhus assassination
//:: act_tha_paytyphu
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC is paid for killing typhus and is a known assassin
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
//give 100 gold, give xp, set pc known as assassin
//starts right after pc kills Typhus
    object oPC = GetFirstPC();
    GiveGoldToCreature(oPC,100);
    GiveXPToCreature(oPC,100);
    SetLocalInt(GetModule(),"OS_KILLTYPHUS",20);
    SetLocalInt(oPC,"OS_PC_ASSASSIN",10);
}
