//::///////////////////////////////////////////////
//:: act_southp_4
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Mark Southpaw votes for PC.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: July 24, 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    object oPC = GetFirstPC();
    if(GetLocalInt(oPC,"OS_THIEVES_GUILD")!=10)
    {
        object oBecket = GetObjectByTag("q2_sirbecket");
        int nBeck = GetLocalInt(GetModule(), "OS_BECKET_VOTES")-1;
        SetLocalInt(GetModule(), "OS_BECKET_VOTES",nBeck);

        os_FirstVote();
        int nVote = GetLocalInt(oPC,"OS_PC_VOTES")+1;
        SetLocalInt(oPC,"OS_PC_VOTES",nVote);
        //FloatingTextStringOnCreature("PC Votes: "+ IntToString(nVote),oPC);
        SetLocalInt(GetFirstPC(),"OS_THIEVES_GUILD",10);
    }
}
