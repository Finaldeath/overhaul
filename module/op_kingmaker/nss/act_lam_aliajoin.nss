//::///////////////////////////////////////////////
//:: Alias enters
//:: act_lam_aliajoin
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Alias enters the Castle
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

#include "q_include"
void main()
{
    object oAlias = GetObjectByTag("q2_alias");
    object oWay = GetObjectByTag("q2c25_way_alias");
    object oMod = GetModule();
    object oPC = GetFirstPC();

    AssignCommand(oAlias,ActionJumpToObject(oWay));
    SetLocalInt(oMod,"OS_PC_LORD",50);
    AddJournalQuestEntry("q1_magicweapon",40,oPC);

    q2_LockCaves();
}
