//::///////////////////////////////////////////////
//:: Conversation
//:: m2q6Neva001
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Neva, Jaheel and Tarran attack.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 9, 2002
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"

void main()
{
    SignalEvent(GetObjectByTag("M2Q6CJAHEEL"),EventUserDefined(600));
    SignalEvent(GetObjectByTag("M2Q6CTARRAN"),EventUserDefined(600));
    DetermineCombatRound();
}
