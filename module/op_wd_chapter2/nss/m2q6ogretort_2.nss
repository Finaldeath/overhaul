//::///////////////////////////////////////////////
//:: Default On Percieve
//:: NW_C2_DEFAULT2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if the perceived target is an
    enemy and if so fires the Determine Combat
    Round function
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 16, 2001
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"

void main()
{
    //Do not bother checking the last target seen if already fighting
    if(!GetIsObjectValid(GetAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
    {
        //Check if the last percieved creature was actually seen
        if(GetLastPerceptionSeen())
        {
            if(GetIsEnemy(GetLastPerceived()))
            {
                DetermineCombatRound();
            }
            else if (GetIsPC(GetLastPerceived()) && GetLocalInt(OBJECT_SELF,"NW_L_Torture") == 0)
            {
                ActionStartConversation(OBJECT_SELF);
            }
        }
        //If the last perception event was hearing based or if someone vanished then go to search mode
        else if ((GetLastPerceptionHeard() || GetLastPerceptionVanished()) && !GetLastPerceptionSeen())
        {
            if(GetIsEnemy(GetLastPerceived()))
            {
            }
        }
    }
}
