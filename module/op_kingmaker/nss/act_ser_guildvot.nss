//::///////////////////////////////////////////////
//:: Get Landowner's Vote
//:: act_ser_guildvot
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has the landowners' guild vote
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    object oPC = GetFirstPC();
    if(GetLocalInt(oPC,"OS_LANDGUILD_PC")!=10)
    {
        object oEnivid = GetObjectByTag("q2_enivid");
        int nEnivid = GetLocalInt(GetModule(), "OS_ENIVID_VOTES")-1;
        SetLocalInt(GetModule(), "OS_ENIVID_VOTES",nEnivid);

        int nVote = GetLocalInt(oPC,"OS_PC_VOTES")+1;
        SetLocalInt(oPC,"OS_PC_VOTES",nVote);
        //FloatingTextStringOnCreature("PC Votes: "+ IntToString(nVote),oPC);
        SetLocalInt(oPC,"OS_LANDGUILD_PC",10);
    }
}
