//::///////////////////////////////////////////////
//:: Witchwork Conversation System: Rage Check
//:: WW_Abil_Rage.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Performs a Rage Check and broadcasts a
    feedback string.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 28, 2002
//:://////////////////////////////////////////////

//This is copied from 'nw_s1_barbrage' with some small modifications to keep it
//from breaking out of conversation and to redefine the target as oPC rather
//than OBJECT_SELF. All of the same stat changes apply.
void Rage(object oPC)
{
    //Declare major variables
    int nLevel = GetLevelByClass(CLASS_TYPE_BARBARIAN, oPC);
    int nIncrease;
    int nSave;
    if (nLevel < 15)
    {
        nIncrease = 4;
        nSave = 2;
    }
    else
    {
        nIncrease = 6;
        nSave = 3;
    }
    AssignCommand(oPC, PlayVoiceChat(VOICE_CHAT_BATTLECRY1));
    //Determine the duration by getting the con modifier after being modified
    int nCon = 3 + GetAbilityModifier(ABILITY_CONSTITUTION, oPC) + nIncrease;
    effect eStr = EffectAbilityIncrease(ABILITY_CONSTITUTION, nIncrease);
    effect eCon = EffectAbilityIncrease(ABILITY_STRENGTH, nIncrease);
    effect eSave = EffectSavingThrowIncrease(SAVING_THROW_WILL, nSave);
    effect eAC = EffectACDecrease(2, AC_DODGE_BONUS);
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);

    effect eLink = EffectLinkEffects(eCon, eStr);
    eLink = EffectLinkEffects(eLink, eSave);
    eLink = EffectLinkEffects(eLink, eAC);
    eLink = EffectLinkEffects(eLink, eDur);
//    SignalEvent(OBJECT_SELF, EventSpellCastAt(OBJECT_SELF, SPELLABILITY_BARBARIAN_RAGE, FALSE));
    //Make effect extraordinary
    eLink = ExtraordinaryEffect(eLink);
    effect eVis = EffectVisualEffect(VFX_IMP_IMPROVE_ABILITY_SCORE); //Change to the Rage VFX

    if (nCon > 0)
    {
        //Apply the VFX impact and effects
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, RoundsToSeconds(nCon));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC) ;
    }
}

void main()
{
    object oPC = GetPCSpeaker();
    int bHasRage = GetHasFeat(FEAT_BARBARIAN_RAGE, oPC);

    //If PC is unable to Rage, do nothing...
    if (bHasRage == FALSE)
    {

    }

    //If the PC can Rage, do so and proceed with the check.
    else
    {
        //Use their fake Rage feat
        AssignCommand(oPC, ActionPauseConversation());
        DecrementRemainingFeatUses(oPC, FEAT_BARBARIAN_RAGE);
        Rage(oPC);
        AssignCommand(oPC, ActionResumeConversation());

        //Get the PC's individual class levels for calculating their total
        //character level.
        int iClass1Level = GetLevelByPosition(1, oPC);
        int iClass2Level = GetLevelByPosition(2, oPC);
        int iClass3Level = GetLevelByPosition(3, oPC);

        //Declare the values used in the Ability Check
        int iDC = GetLocalInt(OBJECT_SELF, "iWW_AbilityDC");
        int iD20 = Random(20)+1;
        int iStrMod = GetAbilityModifier(ABILITY_STRENGTH, oPC);
        int iCharLevel = iClass1Level + iClass2Level + iClass3Level;

        //Create the final Check calculation.
        int iCheck = iD20 + iStrMod + iCharLevel;

        //Convert the above Ints to Strings in preparation for broadcast.
        string sDC = IntToString(iDC);
        string sCheck = IntToString(iCheck);
        string sBroadcast = "You roll: "+sCheck+" vs. DC "+sDC;

        //If the PC's Check >= DC, they succeed.
        if (iCheck >= iDC)
        {
            SetLocalString(OBJECT_SELF, "sWW_AbilityResult", "Success");
        }
        //If not, they fail.
        else
        {
            SetLocalString(OBJECT_SELF, "sWW_AbilityResult", "Failure");
        }
        SendMessageToPC(oPC, sBroadcast);
    }
}
