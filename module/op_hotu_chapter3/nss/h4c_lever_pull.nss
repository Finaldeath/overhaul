//::///////////////////////////////////////////////
//:: Name h4c_lever_pull
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will cause the explosions that are needed
     to kill the Mimic.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: July 31, 2003
//:://////////////////////////////////////////////

// Check to see if the mimic is killed.
void CheckDamageRadius(object oOrb, object oMimic);

void main()
{
    object oOrb = GetObjectByTag("h4c_conductor");
    object oMimic = GetObjectByTag("hx_mimic");
    int iPulled = GetLocalInt(OBJECT_SELF, "HXPulled");

    // Extra explosion locations.
    location lLoc1 = GetLocation(GetObjectByTag("h4c_explosion_wp"));
    location lLoc2 = GetLocation(GetObjectByTag("h4c_explosion_wp", 1));
    location lLoc3 = GetLocation(GetObjectByTag("h4c_explosion_wp", 2));
    location lLoc4 = GetLocation(GetObjectByTag("h4c_explosion_wp", 3));

    // Give a 2 second delay between pulls.
    if(iPulled == 0)
    {
        SetLocalInt(OBJECT_SELF, "HXPulled", 1);
        PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DIVINE_STRIKE_FIRE), GetLocation(oOrb));
        DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIREBALL), GetLocation(oOrb)));
        DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIREBALL), lLoc1));
        DelayCommand(0.6, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIREBALL), lLoc2));
        DelayCommand(0.6, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIREBALL), lLoc3));
        DelayCommand(0.7, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIREBALL), lLoc4));
        DelayCommand(0.8, CheckDamageRadius(oOrb, oMimic));
        DelayCommand(1.5, PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
        // Reset the switch.
        DelayCommand(2.0, SetLocalInt(OBJECT_SELF, "HXPulled", 0));
    }
    else
        //SpeakString("[NOT IN STRING EDITOR] You must wait for the lever to reset.");
        SpeakStringByStrRef(85499);
}

void CheckDamageRadius(object oOrb, object oMimic)
{
    object oObject = GetFirstObjectInShape(SHAPE_SPHERE, 4.0, GetLocation(oOrb), FALSE, OBJECT_TYPE_CREATURE);

    while(GetIsObjectValid(oObject))
    {
        // Kill the mimic.
        if(GetTag(oObject) == "hx_mimic")
        {
            SetPlotFlag(oMimic, FALSE);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIREBALL), GetLocation(oObject));
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oObject);
        }
        // Do damage.
        else
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FLAME_M), oObject);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(Random(100) + 50, DAMAGE_TYPE_FIRE), oObject);
        }
        oObject = GetNextObjectInShape(SHAPE_SPHERE, 4.0, GetLocation(oOrb), FALSE, OBJECT_TYPE_CREATURE);
    }
}
