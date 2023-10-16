//::///////////////////////////////////////////////
//:: Helmed Horror Custom User Defined Event
//:: 2d6_horror_d
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Makes sure that he attacks the iron golem
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 22, 2002
//:://////////////////////////////////////////////

#include "nw_i0_generic"

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1003) // END OF COMBAT
    {
        object oIron = GetNearestObjectByTag("2q6_sanctumgolem");
        if(GetIsObjectValid(oIron))
        {
            ClearAllActions();
            DetermineCombatRound(oIron);
        }
        else
        {
            DestroyObject(OBJECT_SELF);
        }
    }
}

