//::///////////////////////////////////////////////
//:: Reward PC
//:: act_grd_archgood
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The Gord rewards the PC for the archaeologist quest
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
//mark job done, new journal, give xp, gold and magic ring (low)
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
    SetLocalInt(GetModule(), "OS_THEGORD_ARCH",40);
    SetLocalInt(OBJECT_SELF,"OS_THEGORD_JOB",0);
    GiveGoldToCreature(oPC,1000);
    GiveXPToCreature(oPC,250);
    CreateItemOnObject("it_mring006",oPC);
}
