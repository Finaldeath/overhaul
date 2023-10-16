//::///////////////////////////////////////////////
//:: Flirt
//:: TEMPL_FLR01
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Does a check to see if the PC talking to
    the character is male and with at least a
    normal CHR, and the PC is female with a
    high charisma
    50% chance of going down to next priority
*/
//:://////////////////////////////////////////////
//:: Created By: David Gaider
//:: Created On: November 8, 2001
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    if ((GetLocalInt(OBJECT_SELF,"counter")!=1) && (GetLocalInt(OBJECT_SELF,"counter")!=2))
    {
        int roll=d100();
        if (roll>50)
        {
            if (GetAbilityScore(OBJECT_SELF,ABILITY_CHARISMA) > 8)
            {
                if (GetAbilityScore(GetPCSpeaker(),ABILITY_CHARISMA) > 13)
                {
                    if ((GetGender(OBJECT_SELF)==GENDER_MALE) && (GetGender(GetPCSpeaker())==GENDER_FEMALE))
                    {
                        return TRUE;
                    }
                    return FALSE;
                }
                return FALSE;
            }
            return FALSE;
        }
        return FALSE;
    }
    return FALSE;
}
