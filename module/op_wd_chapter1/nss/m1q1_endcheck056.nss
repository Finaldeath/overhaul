//::///////////////////////////////////////////////
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Does a check to see if the PC talking to
    the character is of a different race
    and does not have a high charisma
    (but not human)
    75% chance of going down to next priority
    Checks if Peninsula plot NOT done
*/
//:://////////////////////////////////////////////
//:: Created By: Lukas Kristjanson
//:: Created On: March13,2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    if ((GetLocalInt(OBJECT_SELF,"counter")!=3) && (GetLocalInt(OBJECT_SELF,"counter")!=2) && (GetLocalInt(GetModule(),"NW_G_M1Q2MainPlot")<100))
    {
        int roll=d100();
        if (roll>70)
        {
            if ((GetRacialType(GetPCSpeaker()))!= (GetRacialType(OBJECT_SELF)) && ((GetRacialType(GetPCSpeaker()))!=RACIAL_TYPE_HUMAN))
            {
                if (GetAbilityScore(GetPCSpeaker(),ABILITY_CHARISMA) < 14)
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



