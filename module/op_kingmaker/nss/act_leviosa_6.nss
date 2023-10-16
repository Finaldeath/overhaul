//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     take hide, set Forester's votingf or PC,
     give less xp, set Manticore hunt over
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Sept 3, 2003
//:://////////////////////////////////////////////
#include "os_include"
void main()
{
//    object oHide = GetItemPossessedBy(GetFirstPC(),"os_manticorehide");
    object oPC = GetFirstPC();
    if(GetLocalInt(oPC,"OS_FOREST_GUILD")!=10)
    {
        os_FirstVote();
        int nVote = GetLocalInt(oPC,"OS_PC_VOTES")+1;
        SetLocalInt(oPC,"OS_PC_VOTES",nVote);
        //FloatingTextStringOnCreature("PC Votes: "+ IntToString(nVote),oPC);

        object oBecket = GetObjectByTag("q2_sirbecket");
        int nBecket = GetLocalInt(GetModule(), "OS_BECKET_VOTES")-1;
        SetLocalInt(GetModule(), "OS_BECKET_VOTES",nBecket);
        SetLocalInt(oPC,"OS_FOREST_GUILD",10);
    }
    os_DestroyItem("os_manticorehide");

//    ActionTakeItem(oHide,oPC);
    GiveXPToCreature(oPC,500);
    SetLocalInt(GetModule(), "os_manticorehunt",80);
}
