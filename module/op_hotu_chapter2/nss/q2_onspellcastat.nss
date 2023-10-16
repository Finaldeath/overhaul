//::///////////////////////////////////////////////
//:: Default: On Spell Cast At
//:: q2_onspellcastat
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This determines if the spell just cast at the
    target is harmful or not.

    SEP27: Trying to add a little Area-of-effect IQ
    When affected will move towards the originator
    of the area effect.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 27/03
//:://////////////////////////////////////////////

#include "nw_i0_generic"

void main()
{
    //Do nothing if not the leader
    //if (GetLocalInt(OBJECT_SELF, "nLeader") != 1)
        //return;
    //Do nothing if we are already in combat since the end of combat round script should fire
    if (GetIsInCombat() == TRUE)
        return;

    //Do nothing if in retreat
    if (GetLocalInt(OBJECT_SELF, "nRetreat") == 1)
        return;

    object oGate = GetObjectByTag("q2acitygate");
    if (GetIsObjectValid(oGate) == TRUE && GetLocalInt(OBJECT_SELF, "nOuterGateAttack") == 1)
        return;

    if (GetLocalInt(OBJECT_SELF, "nAttackedTimer") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nAttackedTimer", 1);
        SignalEvent(OBJECT_SELF, EventUserDefined(5000));
        DelayCommand(6.0, SetLocalInt(OBJECT_SELF, "nAttackedTimer", 0));
    }

    object oTarget = GetLastSpellCaster();
    if(GetLastSpellHarmful())
    {
        //if the target is dead - pick the next nearest target
        if (GetIsDead(oTarget) == TRUE)
            oTarget = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, 1, CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);

        ClearAllActions(TRUE);
        if (GetLocalInt(oTarget, "Q2A_OnLedge") == 1)
            ActionEquipMostDamagingRanged();
        else
            ActionEquipMostDamagingMelee();

        //Attack the target
        ActionAttack(oTarget);
    }





}

