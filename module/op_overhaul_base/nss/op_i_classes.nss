//::///////////////////////////////////////////////
//:: Overhaul Include: Classes
//:: op_i_classes.nss
//:://////////////////////////////////////////////
/*
    Include file for classes.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

// Returns the name of the given class, returns "" on error
string GetClassName(int nClassId);

// For 2da fields with "STR" in them returns the right ABILITY_* constant ID instead
// Returns -1 on error
int GetAbilityScoreConstant(string sAbilityName);

// Checks the maximum level of spells castable by oCreature with nClass
// eg a level 1 Wizard with at least 11 intelligence will return 1
// Returns -1 on error
int GetCreatureMaximumSpellLevel(object oCreature, int nClass);

// Checks if the given class can ever learn the given feat according to their feat list
// Does not check ALLCLASSESCANUSE in feat.2da
int GetClassHasFeatOnTheirFeatList(int nClass, int nFeatId);

// Returns the name of the given class, returns "" on error
string GetClassName(int nClassId)
{
    string sTLK = Get2DAString("classes", "Name", nClassId);
    if (sTLK != "")
    {
        return GetStringByStrRef(StringToInt(sTLK));
    }
    return "";
}

// For 2da fields with "STR" in them returns the right ABILITY_* constant ID instead
// Returns -1 on error
int GetAbilityScoreConstant(string sAbilityName)
{
    switch (HashString(sAbilityName))
    {
        case "STR": return ABILITY_STRENGTH; break;
        case "DEX": return ABILITY_DEXTERITY; break;
        case "CON": return ABILITY_CONSTITUTION; break;
        case "INT": return ABILITY_INTELLIGENCE; break;
        case "WIS": return ABILITY_WISDOM; break;
        case "CHA": return ABILITY_CHARISMA; break;
    }
    return -1;
}

// Checks the maximum level of spells castable by oCreature with nClass
// eg a level 1 Wizard with at least 11 intelligence will return 1
// Returns -1 on error
int GetCreatureMaximumSpellLevel(object oCreature, int nClass)
{
    // Check they are a spellcasting class to begin with
    if (StringToInt(Get2DAString("classes", "SpellCaster", nClass)) == 0) return -1;

    // Check the SpellGainTable for the highest one we have
    int nIndex;
    int nLevel             = GetLevelByClass(nClass, oCreature);
    string sSpellGainTable = Get2DAString("classes", "SpellCaster", nClass);
    int nAbilityScore      = GetAbilityScoreConstant(Get2DAString("classes", "PrimaryAbil", nClass));

    // Format is "SpellLevelX"
    int nHighestLevel = -1;
    for (nIndex = 0; nIndex <= 9; nIndex++)
    {
        string sTest = Get2DAString(sSpellGainTable, "SpellLevel" + IntToString(nIndex), nLevel);

        if (sTest != "")
        {
            // Test ability score (10 + spell level) against base ability score
            if (GetAbilityScore(oCreature, nAbilityScore, TRUE) >= 10 + nIndex)
            {
                nHighestLevel = nIndex;
            }
        }
    }
    return nHighestLevel;
}

// Checks if the given class can ever learn the given feat according to their feat list
// Does not check ALLCLASSESCANUSE in feat.2da
int GetClassHasFeatOnTheirFeatList(int nClass, int nFeatId)
{
    string s2da = Get2DAString("classes", "FeatsTable", nClass);

    if (s2da != "")
    {
        // Loop 2da until we find the feat, or not
        int nIndex;
        for (nIndex = 0; nIndex <= Get2DARowCount(s2da); nIndex++)
        {
            string sFeat = Get2DAString(s2da, "FeatIndex", nIndex);
            if (sFeat != "" && StringToInt(sFeat) == nFeatId)
            {
                return TRUE;
            }
        }
    }
    return FALSE;
}
