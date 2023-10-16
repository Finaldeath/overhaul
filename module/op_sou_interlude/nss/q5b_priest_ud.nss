//::///////////////////////////////////////////////
//:: Default: On User Defined
//:: NW_C2_DEFAULTD
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Determines the course of action to be taken
    on a user defined event.
*/
//:://////////////////////////////////////////////
//:: Created By: Don Moar
//:: Created On: April 28, 2002
//:://////////////////////////////////////////////

#include "x1_inc_plot"

void main()
{
    // enter desired behaviour here
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == EVENT_HEARTBEAT)
    {
        int nRand = Random(3);
        if(IsInConversation(OBJECT_SELF) || GetIsInCombat())
            return;
        object oFocus = GetNearestObjectByTag("Lecturn");
        SetFacingPoint(GetPosition(oFocus));
        ClearAllActions();
        if(nRand <= 1)
            ActionPlayAnimation(ANIMATION_LOOPING_TALK_FORCEFUL, 1.2, 5.0);
        else
            ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_TIRED);
    }
    else if(nEvent == 1007) // death
    {
        SetLocalInt(GetModule(),"q5a_Aoists_Murdered", 1);
        object oKiller = GetLastKiller();
        int nAlign = GetAlignmentGoodEvil(oKiller);
        AdjustAlignment(oKiller, ALIGNMENT_CHAOTIC, 5);
        if(nAlign == ALIGNMENT_GOOD || nAlign == ALIGNMENT_NEUTRAL)
        {
            AdjustAlignment(oKiller, ALIGNMENT_EVIL, 5);
        }
        SetPlot("Q5_MUSHARAK_WINE", 80, GetLastKiller());
    }
    return;
}
