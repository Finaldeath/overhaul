// if the number levers are set to a golem number - the golem is summoned to this room

#include "nw_i0_plot"

void DestroyLevers()
{
    object oRightLever = GetObjectByTag("q4b_Lever_a");
    object oLeftLever = GetObjectByTag("q4b_Lever_b");
    effect eDeath = EffectDeath();
    SetPlotFlag(oRightLever, FALSE);
    SetPlotFlag(oLeftLever, FALSE);
    SetPlotFlag(OBJECT_SELF, FALSE);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, oRightLever);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, oLeftLever);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, OBJECT_SELF);
}

void main()
{
    ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    object oPC = GetLastUsedBy();

    object oRightLever = GetObjectByTag("q4b_Lever_a");
    object oLeftLever = GetObjectByTag("q4b_Lever_b");

    int nRightNum = GetLocalInt(oRightLever, "NUMBER");
    int nLeftNum = GetLocalInt(oLeftLever, "NUMBER");

    // Decreasing by one since they represent the next number to be shown
    nRightNum--;
    nLeftNum--;

    object oWP = GetWaypointByTag("q4b_wp_golem_summon");
    effect eVis = EffectVisualEffect(471);
    effect eFire = EffectVisualEffect(VFX_FNF_FIREBALL);
    effect eHold = EffectVisualEffect(VFX_DUR_FREEZE_ANIMATION);
    effect eDeath = EffectDeath();
    eDeath = EffectLinkEffects(eFire, eDeath);
    if(nLeftNum == 5 && nRightNum == 4) // 54 - scavenger
    {
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_54_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_54_ONCE", 1);

        SetLocalInt(OBJECT_SELF, "54", 1);
        Reward_2daXP(oPC, 30);
        object oGolem = GetObjectByTag("q4b_scavenger");
        AssignCommand(oGolem, ClearAllActions());
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oWP));
        AssignCommand(oGolem, ActionJumpToObject(oWP));
        DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eHold, oGolem));
        SetPlotFlag(oGolem, FALSE);
        DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, oGolem));
        DelayCommand(1.1, SetCommandable(FALSE, oGolem));
        if(GetLocalInt(OBJECT_SELF, "79") == 1)
            DelayCommand(5.0, DestroyLevers());

    }
    else if(nLeftNum == 7 && nRightNum == 9) // 79 - Guardian
    {
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_79_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_79_ONCE", 1);

        SetLocalInt(OBJECT_SELF, "79", 1);
        Reward_2daXP(oPC, 31);
        object oGolem = GetObjectByTag("q4b_guard");
        SetLocalInt(oGolem, "STOP_FIGHTING", 1);
        AssignCommand(oGolem, ClearAllActions());
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oWP));
        AssignCommand(oGolem, ActionJumpToObject(oWP));
        DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eHold, oGolem));
        SetPlotFlag(oGolem, FALSE);
        DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, oGolem));
        DelayCommand(1.1, SetCommandable(FALSE, oGolem));
        if(GetLocalInt(OBJECT_SELF, "54") == 1)
            DelayCommand(5.0, DestroyLevers());
    }
    else // zap!
    {
       object oTarget = GetLastUsedBy();
       int nDamage = Random(50) + 10;
       effect eLightning = EffectBeam(VFX_BEAM_LIGHTNING, OBJECT_SELF, BODY_NODE_CHEST);
       effect eVis  = EffectVisualEffect(VFX_IMP_LIGHTNING_S);
       //Adjust damage based on Reflex Save, Evasion and Improved Evasion
       nDamage = GetReflexAdjustedDamage(nDamage, oTarget, GetSpellSaveDC(),SAVING_THROW_TYPE_ELECTRICITY);
       //Set damage effect
       effect eDamage = EffectDamage(nDamage, DAMAGE_TYPE_ELECTRICAL);
       if(nDamage > 0)
       {
           ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);
           ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
       }
    }
}
