//::///////////////////////////////////////////////
//::
//:://////////////////////////////////////////////
/*
    Does a check to see if the PC talking to
    the character is wounded by comparing max HP to
    current HP.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: November 7, 2001
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    if ((GetLocalInt(OBJECT_SELF,"counter")!=1) && (GetLocalInt(OBJECT_SELF,"counter")!=2))
    {
        int CurrentHP=GetCurrentHitPoints(GetPCSpeaker());
        int MaxHP=GetMaxHitPoints(GetPCSpeaker());
        if ((MaxHP)> (CurrentHP))
            {
                return TRUE;
            }

        return FALSE;
    }
    return FALSE;
}
