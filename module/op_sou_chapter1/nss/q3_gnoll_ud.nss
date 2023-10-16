//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    gnoll user defined 101: exit area
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 27/2/2003
//:://////////////////////////////////////////////

#include "q3_inc_plot"

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == 102) // exit room
    {
        object oWP = GetWaypointByTag("Q3A_WP_BATTLE_EXIT1");
        SetLocalInt(OBJECT_SELF, "Q3_LEAVING_AREA", 1);
        ClearAllActions();
        ActionForceMoveToObject(oWP, FALSE, 10.0);
        ActionDoCommand(DestroyObject(OBJECT_SELF));
        SetCommandable(FALSE, OBJECT_SELF);
    }
    else if(nEvent == EVENT_DIALOGUE)
    {
        int nStatus = GetLocalInt(GetModule(), "Q3_GNOLL_STATUS");
        if(nStatus == GNOLL_STATUS_CONTROL_TRIBE)
        {
            object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
            AssignCommand(oPC, PlaySound("c_gnoll_bat1"));
            ClearAllActions();
            ActionPlayAnimation(ANIMATION_FIREFORGET_SALUTE);
        }
    }
}

