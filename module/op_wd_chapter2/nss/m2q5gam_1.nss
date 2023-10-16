//::///////////////////////////////////////////////
//:: Heartbeat
//:: M2Q5Gam_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script moves Gam into the dungeon entrance
    and later into the dungeon itself.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: October 9, 2001
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(GetModule(),"NW_G_M2Q5DungeonEntered") == 20 &&
        GetLocalInt(OBJECT_SELF,"NW_L_Dungeon") == 0)
    {
        ClearAllActions();
        SetLocalInt(OBJECT_SELF,"NW_L_Dungeon",10);
        SetLocalInt(OBJECT_SELF,"NW_L_Move",20);
        ActionJumpToLocation(GetLocation(GetWaypointByTag("WP_GAM_MOVE_DUN")));
        ActionWait(1.0);
        ActionDoCommand(ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDamage(GetCurrentHitPoints() - 10),OBJECT_SELF));
        ActionDoCommand(DelayCommand(3.0,SignalEvent(OBJECT_SELF,EventUserDefined(500))));
    }
    else if (GetLocalInt(GetModule(),"NW_G_M2Q5DungeonEntered") == 10 && GetLocalInt(OBJECT_SELF,"NW_L_Move") == 0)
    {
        ActionJumpToObject(GetWaypointByTag("WP_GAM_MOVE_1"));
        ActionDoCommand(SetLocalInt(OBJECT_SELF,"NW_L_Move",10));
        ActionDoCommand(SetLocalInt(OBJECT_SELF,"NW_L_DungeonEntrance",10));
    }
    else if (GetLocalInt(OBJECT_SELF,"NW_L_Move") == 10)
    {
        if (GetDistanceToObject(GetWaypointByTag("WP_GAM_MOVE_2")) > 3.0)
        {
            ClearAllActions();
            ActionMoveToObject(GetWaypointByTag("WP_GAM_MOVE_2"));
        }
        else
        {
            SetLocalInt(OBJECT_SELF,"NW_L_Move",20);
            SetLocalInt(OBJECT_SELF,"NW_L_DungeonEntrance",10);
        }
    }
}
