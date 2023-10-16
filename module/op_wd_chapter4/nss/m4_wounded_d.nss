//::///////////////////////////////////////////////
//:: M4_WOUNDED_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Gets the NPC to pause as if tired.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    March 21, 2002
//:://////////////////////////////////////////////

#include "nw_i0_generic"
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001)
    {
        ClearAllActions();
        ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_TIRED,1.0,3.0);
    }
    else
    {
        ClearAllActions();
        WalkWayPoints();
    }
}
