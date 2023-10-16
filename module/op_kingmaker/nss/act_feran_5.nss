//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Set that Feran votes for pc, give 1000 xp,
     give 500 gold, set Feran not talking to PC.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Sept. 2003
//:://////////////////////////////////////////////
#include "os_include"
void main()
{
    object oPC = GetFirstPC();
    if(GetLocalInt(oPC,"OS_MILITARYGUILD")!=10)
    {
        object oEnivid = GetObjectByTag("q2_enivid");
        int nEnivid = GetLocalInt(GetModule(), "OS_ENIVID_VOTES")-1;
        SetLocalInt(GetModule(), "OS_ENIVID_VOTES",nEnivid);

        os_FirstVote();
        int nVote = GetLocalInt(oPC,"OS_PC_VOTES")+1;
        SetLocalInt(oPC,"OS_PC_VOTES",nVote);
        //FloatingTextStringOnCreature("PC Votes: "+ IntToString(nVote),oPC);
        SetLocalInt(oPC,"OS_MILITARYGUILD",10);
    }
    SetLocalInt(OBJECT_SELF,"OS_FERANDRINKING",30);
    GiveXPToCreature(oPC,1000);
    GiveGoldToCreature(oPC,500);
}
