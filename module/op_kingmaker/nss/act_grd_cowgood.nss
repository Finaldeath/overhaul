//::///////////////////////////////////////////////
//:: Reward PC
//:: act_grd_cowgood
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The Gord rewards the PC for the cow quest
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
//give 500 gold, give xp, end quest, change journal
    object oPC = GetFirstPC();
    if(GetLocalInt(oPC,"OS_TRADES_GUILD")<10)
    {
        object oEnivid = GetObjectByTag("q2_enivid");
        int nEnivid = GetLocalInt(GetModule(), "OS_ENIVID_VOTES")-1;
        SetLocalInt(GetModule(), "OS_ENIVID_VOTES",nEnivid);

        os_FirstVote();
        int nVote = GetLocalInt(oPC,"OS_PC_VOTES")+1;
        SetLocalInt(oPC,"OS_PC_VOTES",nVote);
        //FloatingTextStringOnCreature("PC Votes: "+ IntToString(nVote),oPC);
        SetLocalInt(oPC,"OS_TRADES_GUILD",10);
    }
    SetLocalInt(GetModule(), "OS_THEGORD_COWS",40);
    SetLocalInt(OBJECT_SELF,"OS_THEGORD_JOB",0);
    GiveGoldToCreature(oPC,500);
    GiveXPToCreature(oPC,250);
}
