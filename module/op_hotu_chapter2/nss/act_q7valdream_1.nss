//::///////////////////////////////////////////////
//:: Name act_q7valdream_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Valsharess releases the PC from his geas

** the Valsharess casts a big dispel on the player to remove the geas
** if "q7_Valsharess_Reward" is 1 = give the robe item,
    it it is 2 = boost the PC's most appropriate stat
** after that, the Valsharess disappears
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 29/03
//:://////////////////////////////////////////////

void BoostStat(object oPC);

void main()
{
    object oPC = GetPCSpeaker();
    effect eVis1 = EffectVisualEffect(VFX_FNF_DISPEL_GREATER);
    effect eVis2 = EffectVisualEffect(VFX_FNF_WORD);
    effect eGeneral = EffectLinkEffects(eVis1, eVis2);
    effect eHead = EffectVisualEffect(VFX_IMP_HEAD_MIND);
    location lVfx = GetLocation(oPC);

    ActionPauseConversation();

    ActionCastFakeSpellAtObject(SPELL_MAGE_ARMOR, oPC);
    DelayCommand(2.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eGeneral, lVfx));
    DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eHead, oPC));


    //Give PC his chosen item (Isaac Sequencer Robe 'x2_sequencer3' - or + 4 to a stat for the duration of the battle
    if (GetLocalInt(GetModule(), "q7_Valsharess_Reward") == 1)
        CreateItemOnObject("x2_dreamrobe", oPC);
    else if (GetLocalInt(GetModule(), "q7_Valsharess_Reward") == 2)
        BoostStat(oPC);

    //Mark the PC as having promised to betray
    SetLocalInt(oPC, "X2_BetrayalPromise", 1);

    DelayCommand(3.0, ActionResumeConversation());

}

//Boost the PCs highest stat by 10
void BoostStat(object oPC)
{
    effect eBoost;
    int nStr = GetAbilityScore(oPC, ABILITY_STRENGTH);

    int nChar = GetAbilityScore(oPC, ABILITY_CHARISMA);

    int nCon = GetAbilityScore(oPC, ABILITY_CONSTITUTION);

    int nDex = GetAbilityScore(oPC, ABILITY_DEXTERITY);

    int nInt = GetAbilityScore(oPC, ABILITY_INTELLIGENCE);

    int nWis = GetAbilityScore(oPC, ABILITY_WISDOM);

    //if Strength is the PCs best stat - boost it)
    if (nStr >= nChar && nStr >= nCon && nStr >= nDex && nStr >= nInt && nStr >= nWis)
        eBoost = EffectAbilityIncrease(ABILITY_STRENGTH, 10);
    //if Charisma is the PCs best stat - boost it)
    else if (nChar >= nStr && nChar >= nCon && nChar >= nDex && nChar >= nInt && nChar >= nWis)
        eBoost = EffectAbilityIncrease(ABILITY_CHARISMA, 10);
     //if Constitution is the PCs best stat - boost it)
    else if (nCon >= nChar && nCon >= nStr && nCon >= nDex && nCon >= nInt && nCon >= nWis)
        eBoost = EffectAbilityIncrease(ABILITY_CONSTITUTION, 10);
     //if Dexterity is the PCs best stat - boost it)
    else if (nDex >= nChar && nDex >= nCon && nDex >= nStr && nDex >= nInt && nDex >= nWis)
        eBoost = EffectAbilityIncrease(ABILITY_DEXTERITY, 10);
     //if Intelligence is the PCs best stat - boost it)
    else if (nInt >= nChar && nInt >= nCon && nInt >= nDex && nInt >= nWis && nInt >= nStr)
       eBoost = EffectAbilityIncrease(ABILITY_INTELLIGENCE, 10);
     //if Wisdom is the PCs best stat - boost it)
    else if (nWis >= nChar && nWis >= nCon && nWis >= nDex && nWis >= nInt && nWis >= nStr)
       eBoost = EffectAbilityIncrease(ABILITY_WISDOM, 10);

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBoost, oPC);
}
