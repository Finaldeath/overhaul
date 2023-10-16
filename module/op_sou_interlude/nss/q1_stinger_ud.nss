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

void ShootBeam(object oAltar)
{
    effect eBeam = EffectBeam(VFX_BEAM_ODD, OBJECT_SELF, BODY_NODE_CHEST);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam, oAltar, 2.0);

    object oAltar2 = GetObjectByTag("Q1_ALTAR");
    object oTop1 = GetObjectByTag("Q1_TOP1");
    object oTop2 = GetObjectByTag("Q1_TOP2");

    effect eBeam1 = EffectBeam(VFX_BEAM_LIGHTNING, oTop1, BODY_NODE_CHEST);
    effect eBeam2 = EffectBeam(VFX_BEAM_LIGHTNING, oTop2, BODY_NODE_CHEST);

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBeam1, oAltar2);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBeam2, oAltar2);

    effect eVis = EffectVisualEffect(VFX_IMP_HARM);
    DelayCommand(0.2, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oAltar2));
}

void HealGhouls(object oAltar)
{
    int i = 1;
    object oGhoul = GetNearestObjectByTag("Q1_GHOUL", oAltar, i);
    //effect eBeam = EffectBeam(VFX_BEAM_ODD, oAltar, BODY_NODE_CHEST);
    while(oGhoul != OBJECT_INVALID)
    {
        i++;
        if(GetIsDead(oGhoul))
        {
            oGhoul = GetNearestObjectByTag("Q1_GHOUL", oAltar, i);
            continue;
        }

        //ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam, oGhoul, 2.0);
        effect eAttack = EffectAttackIncrease(1);
        effect eHeal = EffectHeal(50);
        effect eVis = EffectVisualEffect(VFX_IMP_HEALING_G);
        effect eLink = EffectLinkEffects(eHeal, eVis);
        eLink = EffectLinkEffects(eLink, eAttack);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLink, oGhoul);
        oGhoul = GetNearestObjectByTag("Q1_GHOUL", oAltar, i);
    }
}

void main()
{
    // enter desired behaviour here
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == 1007) // death
    {
        // Heal all ghouls in the area if in the temple (and shoot beams to the altar)
        if(GetTag(GetArea(OBJECT_SELF)) != "q1_StingerCavesTemple")
            return;
        object oAltar = GetNearestObjectByTag("Q1_BEAM_SOURCE");
        if(oAltar == OBJECT_INVALID)
            return;
        DelayCommand(0.5, ShootBeam(oAltar));
        DelayCommand(4.0, HealGhouls(oAltar));

    }
    else if(nEvent == EVENT_PERCEIVE)
    {
        if(GetTag(OBJECT_SELF) == "Q1_STINGER_WAR")
            PlayVoiceChat(VOICE_CHAT_BATTLECRY1, OBJECT_SELF);
    }
    return;

}
