// fire arrow
#include "X0_I0_SPELLS"

void RunMelfAcidImpact(int nSecondsRemaining, object oTarget);

void main()
{
    object oTarget = GetLocalObject(OBJECT_SELF, "TARGET");
    int nCount, nDamage;
    effect eDam;
    effect eVis = EffectVisualEffect(VFX_IMP_ACID_S);
    effect eArrow;
    int nDuration = 3;
    //figure out projectile timing
    float fDist = GetDistanceToObject(oTarget);
    float fDelay = (fDist/25.0);//(3.0 * log(fDist) + 2.0);
    //Check that there is at least one payload damage
    if (nDuration < 1)
    {
        nDuration = 1;
    }
    eArrow = EffectVisualEffect(245);
    if(!MySavingThrow(SAVING_THROW_REFLEX, oTarget, GetReflexSavingThrow(OBJECT_SELF), SAVING_THROW_TYPE_TRAP))
    {
        nDamage = d6(3);
        eDam = EffectDamage(nDamage,DAMAGE_TYPE_ACID);
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis,oTarget));
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam,oTarget));
        nDuration = nDuration * 6;
        DelayCommand(6.0, RunMelfAcidImpact(nDuration, oTarget));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eArrow, oTarget);
    }
    else
    {
        object oInv = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_invisobj", GetLocation(oTarget));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eArrow, oInv);
        //DestroyObject(oInv);
    }

}


void RunMelfAcidImpact(int nSecondsRemaining, object oTarget)
{
    if (GetIsDead(oTarget) == FALSE)
    {
       int nMetaMagic = GetMetaMagicFeat();
       if (nSecondsRemaining % 6 == 0)
       {
            //Roll damage
            int nDamage = d6();
            //check for metamagic
            if (nMetaMagic == METAMAGIC_EMPOWER)
            {
                nDamage = nDamage + (nDamage/2);
            }
            if (nMetaMagic == METAMAGIC_MAXIMIZE)
            {
                nDamage = 6;
            }
            effect eDam = EffectDamage(nDamage, DAMAGE_TYPE_ACID);
            effect eVis = EffectVisualEffect(VFX_IMP_ACID_S);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
       }
       --nSecondsRemaining;
       if (nSecondsRemaining > 0)
       {
          DelayCommand(1.0f,RunMelfAcidImpact(nSecondsRemaining,oTarget));
       }
   }
   // Note:  if the target is dead during one of these second-long heartbeats,
   // the DelayCommand doesn't get run again, and the whole package goes away.
   // Do NOT attempt to put more than two parameters on the delay command.  They
   // may all end up on the stack, and that's all bad.  60 x 2 = 120.
}


