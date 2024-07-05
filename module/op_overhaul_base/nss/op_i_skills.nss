//::///////////////////////////////////////////////
//:: Overhaul Include: Skills
//:: op_i_skills.nss
//:://////////////////////////////////////////////
/*
    Include file for Skills
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_feedback"

// Returns the name of the given skill, returns "" on error
string GetSkillName(int nSkillId);

// Does an opposing skill back with feedback
int GetOpposingSkillCheck(object oCreature, object oVersus, int nSkill, int nDC, int bTake20 = FALSE);


// Returns the name of the given skill, returns "" on error
string GetSkillName(int nSkillId)
{
    string sTLK = Get2DAString("skills", "Name", nSkillId);
    if (sTLK != "")
    {
        return GetStringByStrRef(StringToInt(sTLK));
    }
    return "";
}

// Does an opposing skill back with feedback
int GetOpposingSkillCheck(object oCreature, object oVersus, int nSkill, int nDC, int bTake20 = FALSE)
{
    int nRoll = d20();
    if (bTake20 == TRUE) nRoll = 20;
    // TODO: versus oVersus total skill bonus (versus racial type/alignment)
    int nSkillModifier = GetSkillRank(nSkill, oCreature);

    int nResult;
    if (nRoll + nSkillModifier >= nDC)
    {
        nResult = SKILL_RESULT_SUCCESS;
    }
    else if (20 + nSkillModifier < nDC)
    {
        nResult = SKILL_RESULT_SUCCESS_NOT_POSSIBLE;
    }
    else
    {
        nResult = SKILL_RESULT_FAILURE;
    }
    // Feedback
    SendSkillFeedbackMessage(oCreature, oVersus, nSkill, nResult, nRoll, nSkillModifier, nDC, bTake20);

    if (nResult == SKILL_RESULT_SUCCESS)
    {
        return TRUE;
    }
    return FALSE;
}
