//::///////////////////////////////////////////////
//:: Conversation()
//:: M2Q2H_SlaveLeave
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The nymph slaves leave.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 4, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

void main()
{
    object oExit = GetWaypointByTag("NW_EXIT");

    if (GetLocalInt(GetArea(OBJECT_SELF),"NW_A_SlavesFree") == 10 &&
        GetLocalInt(OBJECT_SELF,"NW_L_Leave") == 0)
    {
        ClearAllActions();
        SetLocalInt(OBJECT_SELF,"NW_L_Leave",10);
        SpeakOneLinerConversation();
        GiveXPToCreature(GetPCSpeaker(),50);
        ActionMoveToObject(oExit);
        DestroyObject(OBJECT_SELF,10.0);
    }
    else if (GetTag(OBJECT_SELF) == "M2Q2HSlave6" &&
             Random(4) == 0)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_NymphSlave",10);
        SpeakOneLinerConversation();
    }
}
