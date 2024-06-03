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

// Returns the name of the given skill, returns "" on error
string GetSkillName(int nSkillId);


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
