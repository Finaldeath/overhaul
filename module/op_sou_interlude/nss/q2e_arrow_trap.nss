
//::///////////////////////////////////////////////////
//:: X0_TRAPSTR_ARROW
//:: OnTriggered script for a projectile trap
//:: Spell fired: SPELL_TRAP_ARROW
//:: Spell caster level: 7
//::
//:: Copyright (c) 2002 Floodgate Entertainment
//:: Created By: Naomi Novik
//:: Created On: 11/17/2002
//::///////////////////////////////////////////////////

#include "x0_i0_projtrap"

void RemoveStone(object oStatue)
{
    SetPlotFlag(oStatue, FALSE);

    effect eHold = GetFirstEffect(oStatue);
    while (GetIsEffectValid(eHold))
    {
        if(GetEffectType(eHold) == EFFECT_TYPE_PETRIFY)
        {
            RemoveEffect(oStatue, eHold);
            effect eVis = EffectVisualEffect(VFX_DUR_PETRIFY);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oStatue);
            return;
        }
        eHold = GetNextEffect(oStatue);
     }

}

void Stone(object oStatue)
{
    effect eStone = EffectPetrify();
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, oStatue);
    //SetPlotFlag(oStatue, TRUE);
}

void FireArrow(object oStatue, object oTarget)
{
    RemoveStone(oStatue);
    AssignCommand(oStatue, ActionAttack(oTarget));
    DelayCommand(0.5, Stone(oStatue));


    //SetLocalObject(oStatue, "TARGET", oTarget);
    //SignalEvent(oStatue, EventUserDefined(101));

}


void main()
{
    string sNum = GetStringRight(GetTag(OBJECT_SELF), 1);
    //object oSource1 = GetNearestObjectByTag("Q2E_TRAP_SOURCE" + sNum, OBJECT_SELF, 1);
    //object oSource2 = GetNearestObjectByTag("Q2E_TRAP_SOURCE" + sNum, OBJECT_SELF, 2);
    object oSource1 = GetNearestObjectByTag("Q2E_ARCHER_STATUE" + sNum, OBJECT_SELF, 1);
    object oSource2 = GetNearestObjectByTag("Q2E_ARCHER_STATUE" + sNum, OBJECT_SELF, 2);
    float fDistance1 = GetDistanceBetween(GetEnteringObject(), oSource1);
    float fDistance2 = GetDistanceBetween(GetEnteringObject(), oSource2);

    if(fDistance1 <= 40.0)
        FireArrow(oSource1, GetEnteringObject());
    if(fDistance2 <= 40.0)
        FireArrow(oSource2, GetEnteringObject());


    /*if(fDistance1 <= 30.0)
        TriggerProjectileTrap(SPELL_MELFS_ACID_ARROW, GetEnteringObject(), 1,

                          oSource1, OBJECT_SELF,
                          PROJECTILE_PATH_TYPE_BALLISTIC);

    if(fDistance2 <= 30.0)
    TriggerProjectileTrap(SPELL_MELFS_ACID_ARROW, GetEnteringObject(), 1,

                          oSource2, OBJECT_SELF,
                          PROJECTILE_PATH_TYPE_BALLISTIC);*/
}

