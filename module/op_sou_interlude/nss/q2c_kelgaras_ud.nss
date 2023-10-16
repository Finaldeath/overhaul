//::///////////////////////////////////////////////
//:: Default: On User Defined
//:: NW_C2_DEFAULTD
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Determines the course of action to be taken
    on a user defined event.
*/
//:://////////////////////////////////////////////
//:: Created By: Don Moar
//:: Created On: April 28, 2002
//:://////////////////////////////////////////////

void Explode(object oObject)
{
    effect eBoom = EffectVisualEffect(VFX_FNF_FIREBALL);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eBoom, oObject);
    int n = 1;
    effect eDam;
    object oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oObject, n);
    effect eKnock = EffectKnockdown();
    float fDelay;
    while (oCreature != OBJECT_INVALID)
    {
        int nRand = d6(1);
        fDelay = GetDistanceBetween(OBJECT_SELF, oCreature) * 0.2;
        eDam = EffectDamage(nRand, DAMAGE_TYPE_SONIC);
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oCreature));
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnock, oCreature, 2.0));
        n++;
        oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oObject, n);
    }

}
void main()
{
    // enter desired behaviour here
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == 101) // final death
    {
        effect eVis = EffectVisualEffect(VFX_IMP_DEATH);
        DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, OBJECT_SELF));
        SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(101));
    }
    if(nEvent == 1007) // death
    {
        if(GetLocalInt(OBJECT_SELF, "FINAL_DEATH") == 1)
            return;
        SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(102));
    }
    return;

}
