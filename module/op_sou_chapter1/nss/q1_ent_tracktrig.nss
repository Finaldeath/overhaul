//::///////////////////////////////////////////////
//:: Name q1_ent_tracktrig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If a ranger/druid/barbarian enters this trigger,
    a pop-up will inform them that they are close
    to some tracks
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: April 1/03
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    //If the blink stag has never been created and this trigger is not 'down'
    if (GetLocalInt(OBJECT_SELF, "nTriggered") != 1)
    {
        object oPC = GetEnteringObject();
        //if it was a PC that crossed the trigger
        if (GetIsPlayerCharacter(oPC) == TRUE)
        {

            if (GetLevelByClass(CLASS_TYPE_RANGER, oPC ) > 0 || GetLevelByClass(CLASS_TYPE_DRUID, oPC ) > 0 || GetLevelByClass(CLASS_TYPE_BARBARIAN, oPC ) > 0)
            {
                SetLocalInt(OBJECT_SELF, "nTriggered", 1);
                FloatingTextStrRefOnCreature(40412, oPC);
            }
        }
    }
}
