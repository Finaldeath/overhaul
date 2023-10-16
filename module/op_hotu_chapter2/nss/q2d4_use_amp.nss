//::///////////////////////////////////////////////
//:: Name q2d4_use_amp
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On use of the amplifier machine..
    Destroy the sound associated with it.
    Destroy the trigger associate with it.
    Free all slaves in the area to go crazy and start
    attacking everyone..
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 6/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
#include "nw_i0_plot"
void UseAmplifier();

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nAmpUseable") == 0)
        SpeakOneLinerConversation("q2d4amplifier");
    else
    {
        PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
        if (GetLocalInt(OBJECT_SELF, "nUseOnce") == 1)
            return;

        UseAmplifier();
    }

}

void UseAmplifier()
{
    SetLocalInt(OBJECT_SELF, "nUseOnce", 1);
    PlaySound("sco_lgsprelec01");

    SetPlotFlag(OBJECT_SELF, FALSE);
    //DelayCommand(25.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, OBJECT_SELF));

    object oSound = GetObjectByTag("snd_q2d4amplifier");
    SoundObjectStop(oSound);
    DestroyObject(oSound);
    object oTrigger = GetObjectByTag("q2d4_amptrigger");
    DestroyObject(oTrigger);

    effect eVis = EffectVisualEffect(VFX_IMP_HEAD_MIND);

    object oTarget;
    object oCreature = GetFirstObjectInArea();
    while (oCreature != OBJECT_INVALID)
    {
        if (GetObjectType(oCreature) == OBJECT_TYPE_CREATURE)
        {
            if (GetStringLeft(GetTag(oCreature), 9) == "q2dthrall")
            {

                int nRandom = Random(4);
                if (nRandom == 3)
                {
                    ChangeToStandardFaction(oCreature, STANDARD_FACTION_COMMONER);
                    PlaySpeakSoundByStrRef(85709); //"Freedom!"
                    SetLocalInt(oCreature, "nFreed", 1);

                }
                else if (nRandom == 2)
                {
                    PlaySpeakSoundByStrRef(85710); //"My mind! So empty! Must find brains!"
                    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectConfused(), oCreature);
                    SetLocalInt(oCreature, "nFreed", 1);
                }
                else
                {
                    ChangeToStandardFaction(oCreature, STANDARD_FACTION_HOSTILE);
                    PlaySpeakSoundByStrRef(85711);//"Gaarrrrghh!"
                    SetLocalInt(oCreature, "nFreed", 1);
                }
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oCreature);
                DelayCommand(4.0, AssignCommand(oCreature, DetermineCombatRound()));
            }
        }
        oCreature = GetNextObjectInArea();
    }

    //Apply More Explosion effects..
    object oTarget1 = GetObjectByTag("q2d4_amptarget_1");
    object oTarget2 = GetObjectByTag("q2d4_amptarget_2");
    object oTarget3 = GetObjectByTag("q2d4_amptarget_3");

    effect eExplode = EffectVisualEffect(VFX_FNF_HOWL_MIND);
    effect eExplode2 = EffectVisualEffect(VFX_IMP_HEAD_MIND);
    effect eExplode3 = EffectVisualEffect(VFX_FNF_ELECTRIC_EXPLOSION);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eExplode2, oTarget1);
    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eExplode2, oTarget2));
    DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eExplode2, oTarget3));

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eExplode, oTarget2);

    DelayCommand(3.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eExplode3, oTarget1));
    DelayCommand(3.25, ApplyEffectToObject(DURATION_TYPE_INSTANT, eExplode3, oTarget2));
    DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eExplode3, oTarget3));



}
