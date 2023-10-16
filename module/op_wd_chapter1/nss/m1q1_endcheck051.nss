//::///////////////////////////////////////////////
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Does a check to see if the PC talking to
    the character is of the same race
    (but not human)
    25% chance of going down to next priority
    Checks if Beggar's Nest plot done
*/
//:://////////////////////////////////////////////
//:: Created By: Lukas Kristjanson
//:: Created On: March13,2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    if ((GetLocalInt(OBJECT_SELF,"counter")!=1) && (GetLocalInt(OBJECT_SELF,"counter")!=2) && (GetLocalInt(GetModule(),"NW_G_M1Q5MainPlot")==100))
    {
        int roll=d100();
        if (roll>50)
        {
            if (((GetRacialType(GetPCSpeaker()))==(GetRacialType(OBJECT_SELF))) && ((GetRacialType(GetPCSpeaker()))!=RACIAL_TYPE_HUMAN))
            {
                return TRUE;
            }
            return FALSE;
        }
        return FALSE;
    }
    return FALSE;
}


