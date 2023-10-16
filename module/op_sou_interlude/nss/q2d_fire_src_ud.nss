// fire source user-defined events:
// 101: shoot fireballs (use the local var "Q2_FIRE_DELAY" as the delay between fireballs).

void Wait()
{
    float fDelay = GetLocalFloat(OBJECT_SELF, "Q2_FIRE_DELAY");
    if(fDelay == 0.0)
        DestroyObject(OBJECT_SELF);
    ActionWait(fDelay);
}

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    object oWP = GetNearestObjectByTag("Q2D_WP_FIRE_TARGET");

    if(nEvent == 101)
    {
        ActionDoCommand(Wait());
        ActionCastSpellAtLocation(SPELL_FIREBALL, GetLocation(oWP), METAMAGIC_ANY, TRUE);
        ActionDoCommand(SignalEvent(OBJECT_SELF, EventUserDefined(101)));
    }
    else if(nEvent == 102)
    {
        ClearAllActions();
    }
}

/*void Fire()
{
    location lTarget = GetLocation(GetNearestObjectByTag("Q2D_WP_FIRE_TARGET"));
    effect eExplode = EffectVisualEffect(VFX_FNF_FIREBALL);
    effect eVis = EffectVisualEffect(VFX_IMP_FLAME_M);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eExplode, lTarget);
    float fDel = GetLocalFloat(OBJECT_SELF, "Q2_FIRE_DELAY");
    object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, lTarget, TRUE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
    effect eDam;
    int nDamage;
    while (GetIsObjectValid(oTarget))
    {
        fDel = GetDistanceBetweenLocations(lTarget, GetLocation(oTarget))/20;
        //Roll damage for each target
        nDamage = d6(5);
        //Adjust the damage based on the Reflex Save, Evasion and Improved Evasion.
        nDamage = GetReflexAdjustedDamage(nDamage, oTarget, 14, SAVING_THROW_TYPE_FIRE);
        //Set the damage effect
        eDam = EffectDamage(nDamage, DAMAGE_TYPE_FIRE);
        if(nDamage > 0)
        {
            // Apply effects to the currently selected target.
            DelayCommand(fDel, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
            DelayCommand(fDel, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
        }

        //Select the next target within the spell shape.
        oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, lTarget, TRUE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
    }
}*/

