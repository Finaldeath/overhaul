//::///////////////////////////////////////////////
//:: Name act_q2dlavgirl2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Slave girl is readied for the arena.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 31/03
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void main()
{
    AddJournalQuestEntry("q2_femslave",10,GetPCSpeaker());

    AutoAlignE(DC_MEDIUM, GetPCSpeaker());
    SetLocalInt(GetModule(), "X2_Q2DSlaveFight", 1);
    object oGirl = OBJECT_SELF;

    location lSelf = GetLocation(OBJECT_SELF);
    effect eVis1 = EffectVisualEffect(VFX_IMP_AC_BONUS);
    effect eVis2 = EffectVisualEffect(VFX_FNF_WORD);
    effect eLink = EffectLinkEffects(eVis1, eVis2);

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eLink, lSelf);

    PlayAnimation(ANIMATION_LOOPING_TALK_PLEADING, 1.0, 2.0);
    DestroyObject(oGirl, 1.0);

    SetCommandable(FALSE, oGirl);

}
