//::///////////////////////////////////////////////
//:: Heartbeat
//:: M2Q5Kasma_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script is used to move Kasma to the
    dungeon entrance and later on into the dungeon
    itself.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: October 9, 2001
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"

void main()
{
    if (GetLocalInt(OBJECT_SELF,"NW_L_HEARTBEAT") == 0)
    {
        if (GetLocalInt(GetModule(),"NW_G_M2Q5DungeonEntered") == 20 &&
            GetLocalInt(OBJECT_SELF,"NW_L_Dungeon") == 0)
        {
            ClearAllActions();
            SetLocalInt(OBJECT_SELF,"NW_L_Dungeon",10);
            SetLocalInt(OBJECT_SELF,"NW_L_Move",20);
            JumpToLocation(GetLocation(GetWaypointByTag("WP_KASMA_MOVE_DUN2")));
        }
        else if (GetLocalInt(GetModule(),"NW_G_M2Q5DungeonEntered") == 10 && GetLocalInt(OBJECT_SELF,"NW_L_Move") == 0)
        {
            ActionJumpToObject(GetWaypointByTag("WP_KASMA_MOVE_1"));
            ActionDoCommand(SetLocalInt(OBJECT_SELF,"NW_L_Move",10));
            ActionDoCommand(SetLocalInt(OBJECT_SELF,"NW_L_DungeonEntrance",10));
        }
        else if (GetLocalInt(OBJECT_SELF,"NW_L_Move") == 10)
        {
            if (GetDistanceToObject(GetWaypointByTag("WP_KASMA_MOVE_2")) > 3.0)
            {
                ClearAllActions();
                ActionMoveToObject(GetWaypointByTag("WP_KASMA_MOVE_2"));
            }
            else
            {
                SetLocalInt(OBJECT_SELF,"NW_L_Move",20);
                SetLocalInt(OBJECT_SELF,"NW_L_DungeonEntrance",10);
            }
        }    //Do not bother checking the last target seen if already fighting
        if(!GetIsObjectValid(GetAttackTarget()) &&
           !GetIsObjectValid(GetAttemptedSpellTarget()) &&
           !GetIsObjectValid(GetAttemptedAttackTarget()) &&
           !GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN)))
        {
            if(GetAssociateState(NW_ASC_HAVE_MASTER))
            {
                if(!GetIsInCombat() || !GetAssociateState(NW_ASC_IS_BUSY))
                {
                    if(!GetAssociateState(NW_ASC_MODE_STAND_GROUND))
                    {
                        if(GetDistanceToObject(GetMaster()) > GetFollowDistance())
                        {
                            //SpeakString("DEBUG: I am moving to master");
                            ClearAllActions();
                            ActionForceMoveToObject(GetMaster(), TRUE, GetFollowDistance());
                        }
                    }
                }
            }
        }
        if(GetSpawnInCondition(NW_FLAG_HEARTBEAT_EVENT))
        {
            SignalEvent(OBJECT_SELF, EventUserDefined(1001));
        }
    }
}
