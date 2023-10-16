
//::///////////////////////////////////////////////////
//:: X0_TRAPSTR_MELFS
//:: OnTriggered script for a projectile trap
//:: Spell fired: SPELL_MELFS_ACID_ARROW
//:: Spell caster level: 9
//::
//:: Copyright (c) 2002 Floodgate Entertainment
//:: Created By: Naomi Novik
//:: Created On: 11/17/2002
//::///////////////////////////////////////////////////

#include "x0_i0_projtrap"

void main()
{
    object oStatueA = GetNearestObjectByTag("Q1_TRAP_STATUEA");
    object oStatueB = GetNearestObjectByTag("Q1_TRAP_STATUEB");
    //TriggerProjectileTrap(SPELL_MELFS_ACID_ARROW, GetEnteringObject(), 5, oStatueA);
    //TriggerProjectileTrap(SPELL_MELFS_ACID_ARROW, GetEnteringObject(), 5, oStatueB);
    SetLocalObject(oStatueA, "TARGET", GetEnteringObject());
    SetLocalObject(oStatueB, "TARGET", GetEnteringObject());
    SignalEvent(oStatueA, EventUserDefined(101));
    SignalEvent(oStatueB, EventUserDefined(101));
    //TriggerProjectileTrap(SPELL_MELFS_ACID_ARROW, GetEnteringObject(), 5, oStatue);
}

