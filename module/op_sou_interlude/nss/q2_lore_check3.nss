//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check PC's lore skill and intelligence modifier
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
int StartingConditional()
{
    int nLore = GetSkillRank(SKILL_LORE, GetPCSpeaker());
    int nIntBonus = GetAbilityModifier(ABILITY_INTELLIGENCE, GetPCSpeaker());
    int nRoll = d20();

    if (((nRoll + nLore + nIntBonus) > 14) && ((nLore + nIntBonus) > 0))
    {
        return TRUE;
    }
    return FALSE;
}
