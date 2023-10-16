//::///////////////////////////////////////////////
//:: Reward PC
//:: act_grd_archbad
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The Gord rewards the PC for the archaeologist quest
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
//give gold, no xp, new journal, mark finished, but not finished for election purposes.
    object oPC = GetFirstPC();
    SetLocalInt(GetModule(), "OS_THEGORD_ARCH",40);
    SetLocalInt(OBJECT_SELF,"OS_THEGORD_JOB",0);
    GiveGoldToCreature(oPC,500);
}
