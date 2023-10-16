//::///////////////////////////////////////////////
//:: User Defined
//:: m2q6Jaheel_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Jaheel and Tarran attack.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 9, 2001
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

void main()
{
    int nEvent = GetUserDefinedEventNumber();

    switch (nEvent)
    {
        case 600:
            DetermineCombatRound();
        break;
    }
}
