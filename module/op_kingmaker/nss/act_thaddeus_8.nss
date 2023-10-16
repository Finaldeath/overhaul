//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Set that PC rewarded for killing Gelani
     Give PC 1000 xp,
     Give PC 100 gold,
     Mark Thaddeus voting for PC
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    object oPC = GetFirstPC();
    if(GetLocalInt(oPC,"OS_MERCHGUILD_PC")!=10)
    {
        os_FirstVote();
        int nVote = GetLocalInt(oPC,"OS_PC_VOTES")+1;
        SetLocalInt(oPC,"OS_PC_VOTES",nVote);
        //FloatingTextStringOnCreature("PC Votes: "+ IntToString(nVote),oPC);

        object oBecket = GetObjectByTag("q2_sirbecket");
        int nBeck = GetLocalInt(GetModule(), "OS_BECKET_VOTES")-1;
        SetLocalInt(GetModule(), "OS_BECKET_VOTES",nBeck);
        SetLocalInt(oPC,"OS_MERCHGUILD_PC",10);
    }
    GiveXPToCreature(oPC,1000);
    GiveGoldToCreature(oPC,100);
    SetLocalInt(GetModule(), "OS_KILLGELANI",99);
}
