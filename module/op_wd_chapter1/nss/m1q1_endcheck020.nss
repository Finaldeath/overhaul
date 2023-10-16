//::///////////////////////////////////////////////
//:: Flirt
//:: TEMPL_FLR01
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns true 50% of the time if a PC Female with
    more than 13 CHR speaks with a Male
    NPC with more than 8 CHR.
    Checks if Docks plot NOT done
*/
//:://////////////////////////////////////////////
//:: Created By: Lukas Kristjanson
//:: Created On: March13,2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    if ((GetLocalInt(OBJECT_SELF,"counter")!=1) && (GetLocalInt(OBJECT_SELF,"counter")!=2) && (GetLocalInt(GetModule(),"NW_G_M1Q4MainPlot")<100))
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
                }
            }
        }
    }
    return FALSE;
}



