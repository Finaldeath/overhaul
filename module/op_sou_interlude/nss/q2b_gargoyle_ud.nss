// Gargoyle statue user define: attack after the second attack

#include "nw_i0_generic"

void Animate()
{
    AdjustReputation(OBJECT_SELF, GetFirstPC(), -100);
    AdjustReputation(GetFirstPC(), OBJECT_SELF, -100);

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ANIMATE_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ANIMATE_ONCE", 1);

    //DelayCommand(1.5, SetPlotFlag(OBJECT_SELF, FALSE));
    SetCommandable(TRUE);
    object oDust = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_statue3", GetLocation(OBJECT_SELF));
    effect eDam = EffectDamage(1000);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oDust);
    effect eHold = GetFirstEffect(OBJECT_SELF);
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    while (GetIsEffectValid(eHold))
    {
        if(GetEffectType(eHold) == EFFECT_TYPE_PETRIFY)
        {
            RemoveEffect(OBJECT_SELF, eHold);

        }
        eHold = GetNextEffect(OBJECT_SELF);
     }
     DetermineCombatRound(oPC);
     effect eVis = EffectVisualEffect(VFX_DUR_PETRIFY);
     ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, OBJECT_SELF);
     //return;
}

void main()
{
    // enter desired behaviour here
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == EVENT_ATTACKED || nEvent == EVENT_SPELL_CAST_AT)
    {
        //int nAttackCount = GetLocalInt(OBJECT_SELF, "COUNT");
        //SetLocalInt(OBJECT_SELF, "COUNT", ++nAttackCount);
        //if(nAttackCount == 2)
        //{
            object oGarg1 = GetNearestObjectByTag("NW_GARGOYLE", OBJECT_SELF, 1);
            object oGarg2 = GetNearestObjectByTag("NW_GARGOYLE", OBJECT_SELF, 2);
            object oGarg3 = GetNearestObjectByTag("NW_GARGOYLE", OBJECT_SELF, 3);
            DelayCommand(2.0, SignalEvent(oGarg1, EventUserDefined(101)));
            DelayCommand(3.0, SignalEvent(oGarg2, EventUserDefined(101)));
            DelayCommand(4.0, SignalEvent(oGarg3, EventUserDefined(101)));
            Animate();
       // }

    }
    else if(nEvent == 1007) // death
    {
        int nCount = GetLocalInt(GetArea(OBJECT_SELF), "Q2B_COUNT");
        nCount++;
        SetLocalInt(GetArea(OBJECT_SELF), "Q2B_COUNT", nCount);
        if(nCount == 4) // time to reveal the puzzle
        {
            SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(101));
        }
    }
    else if(nEvent == 101) // animate
    {
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        Animate();
        DelayCommand(0.5, ActionAttack(oPC));
    }
    else if(nEvent == EVENT_DAMAGED)
    {
        if(GetCurrentHitPoints() == 1)
        {
            SetImmortal(OBJECT_SELF, FALSE);
            effect eStone = EffectPetrify();
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, OBJECT_SELF);
            effect eDeath = EffectDeath();
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDeath, OBJECT_SELF);

        }
    }
    return;

}
