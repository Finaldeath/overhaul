//::///////////////////////////////////////////////
//:: On Percieve
//:: m2q6Brea_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if the perceived target is an
    enemy and if so fires the Determine Combat
    Round function.  This is a modified default
    script.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 8, 2001
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"
#include "NW_I0_PLOT"

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
            else if (GetIsPC(GetLastPerceived()) && GetLocalInt(OBJECT_SELF,"NW_L_Timer1") == 0)
            {
                // Warn the PC to leave.
                ActionStartConversation(OBJECT_SELF);
            }
        }
        //If the last perception event was hearing based or if someone vanished then go to search mode
        else if ((GetLastPerceptionHeard() || GetLastPerceptionVanished()) && !GetLastPerceptionSeen())
        {
            if (GetLastPerceptionVanished() &&
                !GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,PLAYER_CHAR_IS_PC,OBJECT_SELF,1,CREATURE_TYPE_PERCEPTION,PERCEPTION_SEEN)))
            {
                ClearAllActions();
                SetLocalInt(OBJECT_SELF,"NW_L_Timer1",30);
                ActionStartConversation(OBJECT_SELF);
            }

            if(GetIsEnemy(GetLastPerceived()))
            {
            }
        }
    }
}
