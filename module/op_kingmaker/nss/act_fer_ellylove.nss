//::///////////////////////////////////////////////
//:: Ellysia Loves Feran
//:: act_fer_ellylove
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If Ellysia loves Feran, Feran rewards the player
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: September 2003
//:://////////////////////////////////////////////
#include "os_include"
void main()
{
    //give 500 gold, a good hit, set military guild tovote for pc, highest xp
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

    GiveGoldToCreature(oPC,500);
    AdjustAlignment(oPC,ALIGNMENT_GOOD,15);
    object oEllysia = GetObjectByTag("q2_ellysia");
    SetLocalInt(GetModule(), "OS_FERANLOVE",60);
    SetLocalInt(GetModule(), "OS_SERAH_HOMESOLD", 40);

    if(os_GetXPReceived())
    {
        GiveXPToCreature(oPC,1000);
        os_SetXPReceived();
    }
}
