//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: 2Q4D_KURTH_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Kurth will check on his heartbeat for
    enemies he can see.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 17, 2002
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        object oEnemy = GetNearestCreature(CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN, OBJECT_SELF, 1, CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);
        if(GetIsObjectValid(oEnemy))
        {
            DetermineCombatRound();
            SetSpawnInCondition(NW_FLAG_HEARTBEAT_EVENT, FALSE);
        }
    }
}

