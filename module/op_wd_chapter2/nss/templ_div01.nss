//::///////////////////////////////////////////////
//:: Divine Class
//:: TEMPL_DIV01
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Does a check to see if the PC talking to
    the character is a paladin or cleric
    25% chance of going down to next priority
*/
//:://////////////////////////////////////////////
//:: Created By: David Gaider
//:: Created On: November 8, 2001
//:://////////////////////////////////////////////

int StartingConditional()
{
    if ((GetLocalInt(OBJECT_SELF,"counter")!=1) && (GetLocalInt(OBJECT_SELF,"counter")!=2))
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
