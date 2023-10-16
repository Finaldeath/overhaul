//:://////////////////////////////////////////////////
//:: q2_spn_cutbehold
/*
 * Spawn in for Cutscene Beholders - apply Fly-In effect
 *

 */
//:://////////////////////////////////////////////////
//::
//:: Created By: Keith Warner
//:: Created On: Sept 19/03
//:://////////////////////////////////////////////////

void main()
{
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectAppear(), OBJECT_SELF);
}
