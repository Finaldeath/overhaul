//::///////////////////////////////////////////////
//:: act_trp_light
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When Trip finishes singing this line,
    a blast of lightning should shoot out from him and
    destroy a placable object nearby (this can be faked),
    or the other henchman
    The rod is a Rod of Lightning with 15 charges left.
    This should only happen once.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

void main()
{
    object oRock = GetObjectByTag("q3_lightrock");

    ActionPauseConversation();
    ActionCastFakeSpellAtObject(SPELL_LIGHTNING_BOLT, oRock);

    effect eDeath = EffectDeath(TRUE);
    effect eVFX = EffectVisualEffect(VFX_IMP_LIGHTNING_M);

    ActionDoCommand(ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, oRock));
    ActionDoCommand(ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, oRock));

    ActionResumeConversation();
}
