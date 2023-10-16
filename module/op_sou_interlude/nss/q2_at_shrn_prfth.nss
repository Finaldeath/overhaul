//::///////////////////////////////////////////////
//:: Shrine action taken on pretended faithful prayer
//:: q2_at_shrn_prfth
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Player chooses to pretend to pray faithfully at the shrine. Result may vary depending on the following:
    - Alignment evil: minor evil hit and can not use the shrine for healing anymore.
    - Alignment good/neutral: suffers a curse and can not use the shrine for healing anymore
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 26/3/2003
//:://////////////////////////////////////////////

void ShrineCurse(object oPC)
{
    SetLocalInt(oPC, "Q2_SHRINE_GOOD_USE", 1);
    if(GetAlignmentGoodEvil(oPC) != ALIGNMENT_EVIL)
    {
        // suffer a curse effect
        effect eVis = EffectVisualEffect(VFX_IMP_REDUCE_ABILITY_SCORE);
        effect eCurse = EffectCurse(2, 2, 2, 2, 2, 2);
        eCurse = SupernaturalEffect(eCurse);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eCurse, oPC);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    }
    else if(GetAlignmentGoodEvil(oPC) == ALIGNMENT_EVIL)
    {
        effect eVis = EffectVisualEffect(VFX_IMP_REDUCE_ABILITY_SCORE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
        AdjustAlignment(oPC, ALIGNMENT_GOOD, 3);
    }
}

void main()
{
    object oPC = GetPCSpeaker();

    ActionPauseConversation();
    AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP, 0.7, 5.0));
    ActionResumeConversation();
    DelayCommand(4.0, ShrineCurse(oPC));
}

