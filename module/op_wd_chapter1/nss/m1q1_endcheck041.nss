//::///////////////////////////////////////////////
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Does a check to see if the PC talking to
    the character is a paladin or cleric
    25% chance of going down to next priority
    Checks if Beggar's Nest plot done
*/
//:://////////////////////////////////////////////
//:: Created By: Lukas Kristjanson
//:: Created On: March13,2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    if ((GetLocalInt(OBJECT_SELF,"counter")!=2) && (GetLocalInt(OBJECT_SELF,"counter")!=3) && (GetLocalInt(GetModule(),"NW_G_M1Q5MainPlot")==100))
    {
        int roll=d100();
        if (roll>33)
        {
            int nClass;
            nClass = GetLevelByClass(CLASS_TYPE_CLERIC, GetPCSpeaker());
            nClass += GetLevelByClass(CLASS_TYPE_PALADIN, GetPCSpeaker());
            return nClass;
        }
        return FALSE;
    }
    return FALSE;
}



