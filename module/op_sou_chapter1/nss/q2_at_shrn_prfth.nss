//::///////////////////////////////////////////////
//:: Shrine action taken on pretended faithful prayer
//:: q2_at_shrn_prfth
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Player chooses to pretend to pray faithfully at the shrine. Result may vary depending on the following:
    - Alignment good/neutral: minor evil hit and can not use the shrine for healing anymore.
    - Alignment evil: suffers a curse and can not use the shrine for healing anymore
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 3/2/2003
//:://////////////////////////////////////////////

void ShrineCurse(object oPC)
{
    SetLocalInt(oPC, "Q2_SHRINE_EVIL_USE", 1);
    if(GetAlignmentGoodEvil(oPC) == ALIGNMENT_EVIL)
    {
        // suffer a curse effect
        effect eVis = EffectVisualEffect(VFX_IMP_REDUCE_ABILITY_SCORE);
        effect eCurse = EffectCurse(2, 2, 2, 2, 2, 2);
        eCurse = SupernaturalEffect(eCurse);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eCurse, oPC);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    }
    else if(GetAlignmentGoodEvil(oPC) == ALIGNMENT_GOOD)
    {
        effect eVis = EffectVisualEffect(VFX_IMP_REDUCE_ABILITY_SCORE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
        AdjustAlignment(oPC, ALIGNMENT_EVIL, 3);
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

