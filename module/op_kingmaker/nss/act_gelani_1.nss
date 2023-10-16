//::///////////////////////////////////////////////
//:: act_gelani_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Give PC 1000 xp,
     Mark PC has merchant's guild vote
     Mark Thaddeus upset with PC
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Sept 2003
//:://////////////////////////////////////////////
#include "os_include"
void main()
{
    object oPC = GetFirstPC();
    object oThad = GetObjectByTag("q2_thaddeus");
    //if the PC has agreed to help Thaddeus kill Gelani, update journal
    if(GetLocalInt(GetModule(), "OS_KILLGELANI")==10)
    {
        AddJournalQuestEntry("q2_thaddeus",60,oPC);
    }
    if(GetLocalInt(oPC,"OS_MERCHGUILD_PC")!=10)
    {
        object oBecket = GetObjectByTag("q2_sirbecket");
        int nBeck = GetLocalInt(GetModule(), "OS_BECKET_VOTES")-1;
        SetLocalInt(GetModule(), "OS_BECKET_VOTES",nBeck);

        os_FirstVote();
        int nVote = GetLocalInt(oPC,"OS_PC_VOTES")+1;
        SetLocalInt(oPC,"OS_PC_VOTES",nVote);
        //FloatingTextStringOnCreature("PC Votes: "+ IntToString(nVote),oPC);
        SetLocalInt(oPC,"OS_MERCHGUILD_PC",10);
    }
    GiveXPToCreature(oPC,1000);
    SetLocalInt(GetModule(), "OS_HELPGELANI",99);
}
