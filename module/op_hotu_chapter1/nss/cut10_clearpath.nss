//::///////////////////////////////////////////////
//:: Name: cut10_clearpath
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Cutscene 10 Trigger - on enter - non-pc creatures
    will get bombarded by fireballs and killed to keep
    them out of the way
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Nov 29/02
//:://////////////////////////////////////////////

void main()
{
    object oCreature = GetEnteringObject();
    if (GetIsPC(oCreature) == FALSE)
    {
        object oLauncher = GetObjectByTag("cut10_launcher" + IntToString(Random(4) + 1));
        effect eDeath = EffectDeath();
        effect eHit = EffectVisualEffect(VFX_COM_HIT_FIRE);
        effect eEffect = EffectLinkEffects(eDeath, eHit);
        effect eBump = EffectLinkEffects(EffectVisualEffect(VFX_FNF_SCREEN_BUMP), EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_FIRE));
        location lTarget = GetLocation(oCreature);
        float fRange = GetDistanceBetweenLocations(GetLocation(oLauncher),lTarget);
        float fImpactDelay = fRange/12;

        AssignCommand(oLauncher, ActionCastFakeSpellAtLocation(SPELL_FIREBALL, lTarget, PROJECTILE_PATH_TYPE_BALLISTIC));
        ActionWait(fImpactDelay);
        ActionDoCommand(ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, oCreature));

        ActionDoCommand(ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eBump, lTarget));




    }

}
