//::///////////////////////////////////////////////
//:: Ellysia Believe PC
//:: act_ell_beckover
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Ellysia believes that Beckett has cheated on her
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    //change noble vote to PC, give xp, change to sad greeting
    object oPC = GetFirstPC();
    if(GetLocalInt(oPC,"OS_NOBLE_GUILD")!=10)
    {
        object oBecket = GetObjectByTag("q2_sirbecket");
        int nBeck = GetLocalInt(GetModule(), "OS_BECKET_VOTES")-1;
        SetLocalInt(GetModule(), "OS_BECKET_VOTES",nBeck);

        os_FirstVote();
        int nVote = GetLocalInt(oPC,"OS_PC_VOTES")+1;
        SetLocalInt(oPC,"OS_PC_VOTES",nVote);
        //FloatingTextStringOnCreature("PC Votes: "+ IntToString(nVote),oPC);
        SetLocalInt(oPC,"OS_NOBLE_GUILD",10);
    }
    GiveXPToCreature(oPC,1000);
    SetLocalInt(oPC,"OS_BECKET_AFFAIR",20);
    SetLocalInt(GetFirstPC(), "OS_ELLYSIA_MOOD",10);
}
