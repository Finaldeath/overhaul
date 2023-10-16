//::///////////////////////////////////////////////
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Does a check to see if the PC talking to
    the character has an INT of less than 9
    25% chance of going down to next priority
    Checks if Beggar's Nest plot NOT done
*/
//:://////////////////////////////////////////////
//:: Created By: Lukas Kristjanson
//:: Created On: March13,2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    if ((GetLocalInt(OBJECT_SELF,"counter")!=3) && (GetLocalInt(OBJECT_SELF,"counter")!=2) && (GetLocalInt(GetModule(),"NW_G_M1Q5MainPlot")<100))
    {
        int roll=d100();
        if (roll>70)
        {
            int iResult=GetAbilityScore(GetPCSpeaker(),ABILITY_INTELLIGENCE);
            if(iResult<=8)
            {
                return TRUE;
            }
            return FALSE;
        }
        return FALSE;
    }
    return FALSE;
}



