//::///////////////////////////////////////////////
//:: Alias Takes you back
//:: act_ali_takeback
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Alias takes you back to your previous destination
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: September 2003
//:://////////////////////////////////////////////
#include "os_include"
void main()
{
    object oWay;
    object oPC = GetFirstPC();
    int nDest = GetLocalInt(OBJECT_SELF,"OS_ALIAS_DESTINATION");
    SetLocalInt(OBJECT_SELF,"OS_ALIAS_ATDEST",1);
    if(nDest == 20)
    {
        oWay = GetObjectByTag("q3_way_serahcave");
    }
    else if(nDest == 30)
    {
        oWay = GetObjectByTag("q3_map_manticore");
    }
    else if(nDest == 40)
    {
        oWay = GetObjectByTag("q3_map_duergar");
    }
    else if(nDest == 50)
    {
        oWay = GetObjectByTag("q3_map_kobold");
    }
    else if(nDest == 60)
    {
        oWay = GetObjectByTag("q3_map_undead");
    }
    else if(nDest == 70)
    {
        oWay = GetObjectByTag("q1_map_illithid");
    }
    os_MoveParty(oWay,oPC);
    DelayCommand(0.5,ActionJumpToObject(oWay));
}
