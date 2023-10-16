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
#include "nw_i0_generic"

void main()
{
    // enter desired behaviour here
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == 101) // attack in ambush
    {
        object oPC = GetLastPerceived();
        if(GetLastPerceptionSeen() && GetIsEnemy(oPC))
        {
            //ClearAllActions();
            ActionAttack(oPC);
        }
    }
    return;

}
