//::///////////////////////////////////////////////
//:: PC has animal Empathy
//:: os_animal_empath
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has the animal empathy skill
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();

    iResult = GetHasSkill(SKILL_ANIMAL_EMPATHY,oPC)
        || GetHasFeat(FEAT_EPIC_SKILL_FOCUS_ANIMAL_EMPATHY,oPC)
        || GetHasFeat(FEAT_SKILL_FOCUS_ANIMAL_EMPATHY,oPC);
    return iResult;
}
