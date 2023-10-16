//::///////////////////////////////////////////////
//:: Go to Vote
//:: act_ali_tovote
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Alias takes the player to the vote
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////
#include "os_include"
void main()
{
    object oWay = GetObjectByTag("q2_way_pcvote");
    object oPC = GetFirstPC();
    SetLocalInt(oPC,"OS_START_VOTE",10);
    SetLocalInt(OBJECT_SELF,"OS_ALIAS_VOTE",30);
    os_MoveParty(oWay,oPC);
    DelayCommand(0.5,ActionJumpToObject(oWay));
}
