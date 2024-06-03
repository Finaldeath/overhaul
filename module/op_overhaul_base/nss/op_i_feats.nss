//::///////////////////////////////////////////////
//:: Overhaul Include: Feats
//:: op_i_feats.nss
//:://////////////////////////////////////////////
/*
    Include file for Feats.

    For now just contains the functions to work out if a given feat can be
    obtained by a given creature. This is done using ObjectToJson so it
    is quite costly. You need to pass in the Json into each check.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_skills"
#include "op_i_classes"

const int FEAT_INVALID = -1;

// Checks if the given creature has nFeatId learned.
// jCreature should be ObjectToJson(oCreater)
int GetHasLearnedFeat(int nFeatId, object oCreature, json jCreature);

// Checks if at levelup oCreature could take nFeatId in their current setup
// oFeedbackCreature - The creature to send feedback on the test failure to, if any.
int GetHasFeatPrerequisites(int nFeatId, object oCreature, json jCreature, object oFeedbackCreature = OBJECT_INVALID);

// Returns the name of the given feat, returns "" on error
string GetFeatName(int nFeatId);

// Gets the given weapons Weapon Specialization feat
int GetItemWeaponSpecializationFeat(object oItem);

// Gets the given weapons Weapon Focus
int GetItemWeaponFocusFeat(object oItem);


// Checks if the given creature has nFeatId learned.
// jCreature should be ObjectToJson(oCreater)
int GetHasLearnedFeat(int nFeatId, object oCreature, json jCreature)
{
    if (GetObjectType(oCreature) != OBJECT_TYPE_CREATURE) return FALSE;

    // If not got feat at all, not learned! Bit of optimisation
    if (!GetHasFeat(nFeatId, oCreature, TRUE)) return FALSE;

    // Check the FeatList which should be sufficient (we don't care
    // what level something was learned)
    json jFeatList = JsonObjectGet(jCreature, "FeatList");
    jFeatList = JsonObjectGet(jFeatList, "value");

    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jFeatList); nIndex++)
    {
        json jObject = JsonArrayGet(jFeatList, nIndex);

        // Get the object ID
        int nArrayFeat = JsonGetInt(JsonObjectGet(JsonObjectGet(jObject, "Feat"), "value"));

        if (nArrayFeat == nFeatId)
        {
            return TRUE;
        }
    }
    return FALSE;
}

// Checks if at levelup oCreature could take nFeatId in their current setup
// oFeedbackCreature - The creature to send feedback on the test failure to, if any.
int GetHasFeatPrerequisites(int nFeatId, object oCreature, json jCreature, object oFeedbackCreature = OBJECT_INVALID)
{
    // Check feat.2da requirements in order
    string sTest;
    int nIndex;
    string sFeedbackStart = GetFeatName(nFeatId) + " cannot be learned by " + GetName(oCreature) + ": ";

    // MINATTACKBONUS
    sTest = Get2DAString("feat", "MINATTACKBONUS", nFeatId);
    if (sTest != "" && GetBaseAttackBonus(oCreature) < StringToInt(sTest))
        { SendMessageToPC(oFeedbackCreature, sFeedbackStart + "Does not meet base attack bonus minimum ("+sTest+")"); return FALSE; }

    // MINSTR   MINDEX   MININT   MINWIS   MINCON   MINCHA
    sTest = Get2DAString("feat", "MINSTR", nFeatId);
    if (sTest != "" && GetAbilityScore(oCreature, ABILITY_STRENGTH, TRUE) < StringToInt(sTest))
        { SendMessageToPC(oFeedbackCreature, sFeedbackStart + "Does not meet strength score minimum ("+sTest+")"); return FALSE; }
    sTest = Get2DAString("feat", "MINDEX", nFeatId);
    if (sTest != "" && GetAbilityScore(oCreature, ABILITY_DEXTERITY, TRUE) < StringToInt(sTest))
        { SendMessageToPC(oFeedbackCreature, sFeedbackStart + "Does not meet dexterity score minimum ("+sTest+")"); return FALSE; }
    sTest = Get2DAString("feat", "MININT", nFeatId);
    if (sTest != "" && GetAbilityScore(oCreature, ABILITY_INTELLIGENCE, TRUE) < StringToInt(sTest))
        { SendMessageToPC(oFeedbackCreature, sFeedbackStart + "Does not meet intelligence score minimum ("+sTest+")"); return FALSE; }
    sTest = Get2DAString("feat", "MINWIS", nFeatId);
    if (sTest != "" && GetAbilityScore(oCreature, ABILITY_WISDOM, TRUE) < StringToInt(sTest))
        { SendMessageToPC(oFeedbackCreature, sFeedbackStart + "Does not meet wisdom score minimum ("+sTest+")"); return FALSE; }
    sTest = Get2DAString("feat", "MINCON", nFeatId);
    if (sTest != "" && GetAbilityScore(oCreature, ABILITY_CONSTITUTION, TRUE) < StringToInt(sTest))
        { SendMessageToPC(oFeedbackCreature, sFeedbackStart + "Does not meet constitution score minimum ("+sTest+")"); return FALSE; }
    sTest = Get2DAString("feat", "MINCHA", nFeatId);
    if (sTest != "" && GetAbilityScore(oCreature, ABILITY_CHARISMA, TRUE) < StringToInt(sTest))
        { SendMessageToPC(oFeedbackCreature, sFeedbackStart + "Does not meet charisma score minimum ("+sTest+")"); return FALSE; }

    // MINSPELLLVL
    // Checks for each class:
    // - If they have the minimum ability score
    // - What slots they get so any slots at that class level
    sTest = Get2DAString("feat", "MINSPELLLVL", nFeatId);
    if (sTest != "")
    {
        int bFoundCasterClass = FALSE;
        for (nIndex = 1; nIndex <= 8; nIndex++)
        {
            int nClass = GetClassByPosition(nIndex, oCreature);

            if (nClass == CLASS_TYPE_INVALID) break;

            if (GetCreatureMaximumSpellLevel(oCreature, nClass) >= StringToInt(sTest))
            {
                bFoundCasterClass = TRUE;
            }
        }
        if (!bFoundCasterClass)
            SendMessageToPC(oFeedbackCreature, sFeedbackStart + "Does not meet minimum spell level requirement ("+sTest+")");
    }

    // PREREQFEAT1   PREREQFEAT2
    sTest = Get2DAString("feat", "PREREQFEAT1", nFeatId);
    if (sTest != "" && !GetHasLearnedFeat(StringToInt(sTest), oCreature, jCreature))
        { SendMessageToPC(oFeedbackCreature, sFeedbackStart + "Does not have required feat ("+GetFeatName(StringToInt(sTest))+")"); return FALSE; }
    sTest = Get2DAString("feat", "PREREQFEAT2", nFeatId);
    if (sTest != "" && !GetHasLearnedFeat(StringToInt(sTest), oCreature, jCreature))
        { SendMessageToPC(oFeedbackCreature, sFeedbackStart + "Does not have required feat ("+GetFeatName(StringToInt(sTest))+")"); return FALSE; }

    // ALLCLASSESCANUSE
    // Need to test then the classes individual lists! fun...
    sTest = Get2DAString("feat", "ALLCLASSESCANUSE", nFeatId);
    if (StringToInt(sTest) == 0)
    {
        int bFoundClassWithFeat = FALSE;
        for (nIndex = 1; nIndex <= 8; nIndex++)
        {
            int nClass = GetClassByPosition(nIndex, oCreature);

            if (nClass == CLASS_TYPE_INVALID) break;

            if (GetClassHasFeatOnTheirFeatList(nClass, nFeatId))
            {
                bFoundClassWithFeat = TRUE;
            }
        }
        if (!bFoundClassWithFeat)
            SendMessageToPC(oFeedbackCreature, sFeedbackStart + "Does not have feat on any of their class feat lists");
    }


    // OrReqFeat0   OrReqFeat1   OrReqFeat2   OrReqFeat3   OrReqFeat4
    // Any of these are valid, or ignore all if 0 isn't present
    sTest = Get2DAString("feat", "OrReqFeat0", nFeatId);
    if (sTest != "")
    {
        int bFoundFeat = FALSE;
        string sList;
        for(nIndex = 0; nIndex <= 4; nIndex++)
        {
            sTest = Get2DAString("feat", "OrReqFeat" + IntToString(nIndex), nFeatId);
            if (sTest != "")
            {
                if (GetHasLearnedFeat(StringToInt(sTest), oCreature, jCreature))
                {
                    bFoundFeat = TRUE;
                    break;
                }
                if (sList == "")
                {
                    sList = GetFeatName(StringToInt(sTest));
                }
                else
                {
                    sList = sList + "," + GetFeatName(StringToInt(sTest));
                }
            }
        }
        if (bFoundFeat == FALSE)
            { SendMessageToPC(oFeedbackCreature, sFeedbackStart + "Does not have one of the required prerequisite feats ("+sList+")"); return FALSE; }
    }

    // REQSKILL   ReqSkillMinRanks
    sTest = Get2DAString("feat", "REQSKILL", nFeatId);
    if (sTest != "")
    {
        int nSkill = StringToInt(sTest);
        if (!GetHasSkill(nSkill, oCreature))
            { SendMessageToPC(oFeedbackCreature, sFeedbackStart + "Does not have one of the required skills learned ("+GetSkillName(nSkill)+")"); return FALSE; }

        sTest = Get2DAString("feat", "ReqSkillMinRanks", nFeatId);
        if (sTest != "" && GetSkillRank(nSkill, oCreature, TRUE) < StringToInt(sTest))
            { SendMessageToPC(oFeedbackCreature, sFeedbackStart + "Does not have one of the required skills ("+GetSkillName(nSkill)+") rank ("+sTest+")"); return FALSE; }
    }

    // REQSKILL2   ReqSkillMinRanks2
    sTest = Get2DAString("feat", "REQSKILL2", nFeatId);
    if (sTest != "")
    {
        int nSkill = StringToInt(sTest);
        if (!GetHasSkill(nSkill, oCreature))
            { SendMessageToPC(oFeedbackCreature, sFeedbackStart + "Does not have one of the required skills learned ("+GetSkillName(nSkill)+")"); return FALSE; }

        sTest = Get2DAString("feat", "ReqSkillMinRanks2", nFeatId);
        if (sTest != "" && GetSkillRank(nSkill, oCreature, TRUE) < StringToInt(sTest))
            { SendMessageToPC(oFeedbackCreature, sFeedbackStart + "Does not have one of the required skills ("+GetSkillName(nSkill)+") rank ("+sTest+")"); return FALSE; }
    }

    // MinLevel  MinLevelClass
    sTest = Get2DAString("feat", "MinLevel", nFeatId);
    if (sTest != "")
    {
        int nLevel = StringToInt(sTest);
        if (GetHitDice(oCreature) < nLevel)
            { SendMessageToPC(oFeedbackCreature, sFeedbackStart + "Does not have the required level ("+sTest+")"); return FALSE; }

        sTest = Get2DAString("feat", "MinLevelClass", nFeatId);
        if (sTest != "" && GetLevelByClass(StringToInt(sTest), oCreature) < nLevel)
            { SendMessageToPC(oFeedbackCreature, sFeedbackStart + "Does not have the required level ("+IntToString(nLevel)+") in the given class ("+GetClassName(StringToInt(sTest))+")"); return FALSE; }
    }

    // MaxLevel
    sTest = Get2DAString("feat", "MaxLevel", nFeatId);
    if (sTest != "" && !GetHitDice(oCreature) > StringToInt(sTest))
        { SendMessageToPC(oFeedbackCreature, sFeedbackStart + "Is too high level. Maximum level is ("+sTest+")"); return FALSE; }

    // MinFortSave
    sTest = Get2DAString("feat", "MinFortSave", nFeatId);
    if (sTest != "")
    {
        // Gets the raw fortitude saving throw from the creature Json
        int nFortitude = JsonGetInt(JsonObjectGet(jCreature, "FortSaveThrow"));

        if (nFortitude < StringToInt(sTest))
            { SendMessageToPC(oFeedbackCreature, sFeedbackStart + "Does not have the required fortitude saving throw amount ("+sTest+")"); return FALSE; }
    }

    // PreReqEpic
    sTest = Get2DAString("feat", "MinLevel", nFeatId);
    if (sTest != "")
    {
        int nLevel = StringToInt(sTest);
        if (GetHitDice(oCreature) < 21)
            { SendMessageToPC(oFeedbackCreature, sFeedbackStart + "Is not epic level."); return FALSE; }
    }

    return TRUE;
}

// Returns the name of the given feat, returns "" on error
string GetFeatName(int nFeatId)
{
    string sTLK = Get2DAString("feat", "FEAT", nFeatId);
    if (sTLK != "")
    {
        return GetStringByStrRef(StringToInt(sTLK));
    }
    return "";
}

// Gets the given weapons Weapon Specialization feat
int GetItemWeaponSpecializationFeat(object oItem)
{
    string sFeat = Get2DAString("baseitems", "WeaponSpecializationFeat", GetBaseItemType(oItem));
    if (sFeat != "")
    {
        return StringToInt(sFeat);
    }
    return FEAT_INVALID;
}

// Gets the given weapons Weapon Focus
int GetItemWeaponFocusFeat(object oItem)
{
    string sFeat = Get2DAString("baseitems", "WeaponFocusFeat", GetBaseItemType(oItem));
    if (sFeat != "")
    {
        return StringToInt(sFeat);
    }
    return FEAT_INVALID;
}

