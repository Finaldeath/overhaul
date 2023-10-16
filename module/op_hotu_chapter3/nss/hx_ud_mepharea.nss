//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName hx_ud_mepharea
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will have Meph fly in when called for.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Sept 10, 2003
//:://////////////////////////////////////////////
#include "hx_inc_meph"
#include "achievement_lib"
void SpawnMeph(location lLoc);
void main()
{
    int nUser = GetUserDefinedEventNumber();
    object oPC = GetFirstPC();
    if(nUser == 4444)
    {
        location lLoc = GetLocation(GetObjectByTag("hx_meph_spawns_wp"));

        DelayCommand(3.0, SpawnMeph(lLoc));
    }
    if(nUser == 5555)
    {
        object oSound = GetObjectByTag("hx_lava_sound");

        CleanLava(oSound);
        DelayCommand(0.5, CleanLava(oSound, TRUE));
    }
    if(nUser == 7777)
    {
        location lLoc = GetLocation(GetObjectByTag("hx_final_end_movie_wp"));
        SetLocalInt(GetModule(), "X2_MEPH_IS_DEAD", 1);

        PlotAchievement(GetFirstPC(), 6);

        DelayCommand(5.0, AssignCommand(GetFirstPC(), ClearAllActions(TRUE)));
        DelayCommand(5.2, AssignCommand(GetFirstPC(), ActionJumpToLocation(lLoc)));
    }
}

void SpawnMeph(location lLoc)
{
    CreateObject(OBJECT_TYPE_CREATURE, "hx_meph_end4", lLoc);
}
