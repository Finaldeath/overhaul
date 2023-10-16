//::///////////////////////////////////////////////
//:: PC Rewarded
//:: act_ser_chfrward
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC is rewarded for bringing Serah the Goblin chieftain's head
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
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
    os_DestroyItem("q3_itm_chiefhead");
//    object oHead = GetItemPossessedBy(oPC,"q3_itm_chiefhead");
    GiveGoldToCreature(oPC,200);
    SetLocalInt(oPC,"os_serahcaves",99);
    if(os_GetXPReceived())
    {
        os_SetXPReceived();
        GiveXPToCreature(oPC,1000);
    }
}
