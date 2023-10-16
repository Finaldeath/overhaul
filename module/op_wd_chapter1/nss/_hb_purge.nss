/*
    [_HB_Purge.nss] by Rob Bartel & Preston Watamaniak

    This script is used in m1q2 to purge encounter-spawned creatures from the
    system, thereby optimizing performance.

    It will cause creatures to perform a random walk for at least one heartbeat.
    If they are not in combat and the player is not within 10.0 meters,
    they will move to the nearest door and destroy themself there.
*/

void main()
{

    object oTarget = GetAttemptedAttackTarget();
    object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_HEARD);
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_HEARD);
    int nFlee = GetLocalInt(OBJECT_SELF, "M1Q2_FLEE_FROM_AREA");

    if(nFlee == FALSE)
    {
//        ClearAllActions();
        ActionRandomWalk();
        SetLocalInt(OBJECT_SELF, "M1Q2_FLEE_FROM_AREA", TRUE);
    }

    if(nFlee == TRUE)
    {
        if(!GetIsObjectValid(oPC))
        {
            if(!GetIsObjectValid(oTarget))
            {
                object oDoor = GetNearestObject(OBJECT_TYPE_DOOR);
                if(GetIsObjectValid(oDoor))
                {
                    ClearAllActions();
                    ActionForceMoveToObject(oDoor);
//                    SetLocalInt(OBJECT_SELF, "M1Q2_FLEE_FROM_AREA", 2);
//                    SetLocalObject(OBJECT_SELF, "M1Q2_FLEE_POINT", oDoor);
                    DestroyObject(OBJECT_SELF, 0.5);
                }
            }
        }
    }
/*    else
    {
        object oFleePoint = GetLocalObject(OBJECT_SELF, "M1Q2_FLEE_POINT");
        if(GetDistanceToObject(oFleePoint) < 2.0)
        {
            DestroyObject(OBJECT_SELF, 1.0);
        }
    } */
}
