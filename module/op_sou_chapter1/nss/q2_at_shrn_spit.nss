//::///////////////////////////////////////////////
//:: Shrine action taken on dishonor shrine
//:: q2_at_shrn_spit
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Player chooses to pretend to spit on the shrine. Result may vary depending on the following:
    - Alignment good/neutral: major evil hit and a curse effect and can not use the shrine for healing anymore.
    - Alignment evil: suffers a curse and can not use the shrine for healing anymore
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 3/2/2003
//:://////////////////////////////////////////////


void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "Q2_SHRINE_EVIL_USE", 1);
    effect eVis = EffectVisualEffect(VFX_IMP_REDUCE_ABILITY_SCORE);
    effect eCurse = EffectCurse(2, 2, 2, 2, 2, 2);
    eCurse = SupernaturalEffect(eCurse);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eCurse, oPC);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);

    if(GetAlignmentGoodEvil(oPC) != ALIGNMENT_EVIL) // good or neutral
        AdjustAlignment(oPC, ALIGNMENT_EVIL, 3);

}

