//::///////////////////////////////////////////////
//:: q2b03_explode
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Cause the explosion that clears the way to Level 2
    of Undermountain.  Destroy the 2 obstructing boulders
    and the barrel (along with its contents).  IF the PC
    used more than the requirement, the explosion is bigger
    and can damage the PC.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith W
//:: Created On: September 23/02
//:://////////////////////////////////////////////
#include "nw_i0_generic"
#include "nw_i0_plot"
#include "x2_inc_plot"

void DoSmoke();
void main()
{
            object oPC = GetPCSpeaker();

            //If the correct objects are in the barrel(through conversation),
            //start a timer and destroy the boulders.

            object oBoulder1 = GetObjectByTag("q2b03Boulder1");
            object oBoulder2 = GetObjectByTag("q2b03Boulder2");


            //create some explosion effects and flashy stuff
            location lTarget1 = GetLocation(oBoulder1);
            location lTarget2 = GetLocation(oBoulder2);
            location lTarget3 = GetLocation(OBJECT_SELF);

            effect eEffect1 = EffectVisualEffect(VFX_FNF_SMOKE_PUFF);
            effect eEffect2 = EffectVisualEffect(VFX_FNF_SCREEN_SHAKE);
            effect eEffect3 = EffectVisualEffect(VFX_FNF_SCREEN_BUMP);
            effect eEffect4 = EffectVisualEffect(VFX_FNF_FIREBALL);
            effect eEffect5 = EffectVisualEffect(VFX_FNF_METEOR_SWARM);
            effect eEffect6 = EffectVisualEffect(VFX_FNF_FIRESTORM);



            DoSmoke();
            DelayCommand(2.5f,DoSmoke());
            DelayCommand(5.0f,DoSmoke());
            effect eFire = EffectBeam(VFX_BEAM_FIRE,OBJECT_SELF,  BODY_NODE_CHEST);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eFire,OBJECT_SELF);
            DelayCommand(6.0f,ExecuteScript("q2b03_detonate",OBJECT_SELF));

            //RewardXP to the party
            if (GetPCTotalLevel(oPC) < 15)
            {
                Reward_2daXP(oPC, 14, TRUE);
            }
            else
            {
                Reward_2daXP(oPC, XP_HIGH, TRUE);
             }


            //Add the journal entry 'q2b03sealedpassage', state 20
            AddJournalQuestEntry("q2b03sealedpassage", 20, GetPCSpeaker());
            SetLocalInt(GetModule(), "X2_SealedPassageOpen", 1);
            object oLowerDoor = GetObjectByTag("at_level2_level1");
            SetLocked(oLowerDoor, FALSE);

            effect eDamage = EffectDamage(500);
            SetPlotFlag(oBoulder1, FALSE);
            SetPlotFlag(oBoulder2, FALSE);
            DelayCommand(6.1, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oBoulder1));
            DelayCommand(6.4, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oBoulder1));

            //DestroyObject(oBoulder1, 6.4);
            //DestroyObject(oBoulder2, 6.4);

            DestroyObject(OBJECT_SELF,6.5f);



}

void DoSmoke()
{
    effect eSmoke = EffectVisualEffect(VFX_FNF_SMOKE_PUFF);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,eSmoke,OBJECT_SELF);
}



