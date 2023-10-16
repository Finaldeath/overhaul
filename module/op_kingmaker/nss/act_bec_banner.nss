//::///////////////////////////////////////////////
//:: The PC makes Beckett Banner
//:: act_bec_banner
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    set these guilds as voting for pc:
    Merchants
    Thieves
    Nobles
    Foresters
    give xp, give 500 gold
    set to next starting condition
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////
#include "os_include"
void main()
{
    object oPC = GetFirstPC();
    int nCount;
    if(GetLocalInt(oPC,"OS_MERCHGUILD_PC")==10)
    {
        nCount = nCount + 1;
    }
    else
    {
        SetLocalInt(oPC,"OS_MERCHGUILD_PC",10);
    }
    if(GetLocalInt(oPC,"OS_NOBLE_GUILD")==10)
    {
        nCount = nCount + 1;
    }
    else
    {
        SetLocalInt(oPC,"OS_NOBLE_GUILD",10);
    }
    if(GetLocalInt(oPC,"OS_THIEVES_GUILD")==10)
    {
        nCount = nCount + 1;
    }
    else
    {
        SetLocalInt(oPC,"OS_THIEVES_GUILD",10);
    }
    if(GetLocalInt(oPC,"OS_FOREST_GUILD")==10)
    {
        nCount = nCount + 1;
    }
    else
    {
        SetLocalInt(oPC,"OS_FOREST_GUILD",10);
    }
    SetLocalInt(GetModule(), "OS_BECKET_VOTES",0);
    GiveXPToCreature(oPC,600);
    GiveGoldToCreature(oPC,500);

    SetLocalInt(OBJECT_SELF,"OS_BECKET_BANNER",10);
    nCount = 4-nCount;
    int nVote = GetLocalInt(oPC,"OS_PC_VOTES");
    os_FirstVote();
    nVote = nVote+nCount;
    SetLocalInt(oPC,"OS_PC_VOTES",nVote);
    //FloatingTextStringOnCreature("PC Votes: "+ IntToString(nVote),oPC);
}
