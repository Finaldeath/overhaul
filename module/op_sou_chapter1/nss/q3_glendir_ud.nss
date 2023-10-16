//::///////////////////////////////////////////////
//:: Glendir's User Defined Event
//:: q3_glendir_ud
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     shouts for help when seeing a pc
*/

#include "q3_inc_plot"

void main()
{
    int nEvent = GetUserDefinedEventNumber();

    if (nEvent == EVENT_HEARTBEAT)
    {
        object oFollow = GetLocalObject(OBJECT_SELF, "Q3_FOLLOW");
        if(oFollow != OBJECT_INVALID)
        {
            ActionForceFollowObject(oFollow);
            return;
        }
        if(GetIsInCombat() || IsInConversation(OBJECT_SELF))
            return;

        object oCage = GetObjectByTag("Q3_CAGE_WALL");
        if(oCage == OBJECT_INVALID)
            return;

        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        float fDistance = GetDistanceBetween(oPC, OBJECT_SELF);
        if(fDistance > 15.0 || GetPlot("Q3_JOURNAL_GLENDIR") != 0)
            return;


        SetFacingPoint(GetPosition(oPC));
        ActionPlayAnimation(ANIMATION_LOOPING_TALK_PLEADING, 1.5, 4.0);
        SpeakOneLinerConversation("q3_beg", oPC);

    }

}


