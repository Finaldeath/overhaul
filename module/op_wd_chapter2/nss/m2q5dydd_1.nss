//::///////////////////////////////////////////////
//:: Heartbeat
//:: M2Q5Dydd_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script is used to move Dydd to the
    dungeon entrance.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: October 9, 2001
//:://////////////////////////////////////////////

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
            CreateObject(OBJECT_TYPE_ITEM,"M2Q01IDYDDJOUR",GetLocation(GetWaypointByTag("WP_DYDD_MOVE_DUN2")));
            CreateObject(OBJECT_TYPE_CREATURE,"m2q05cdydd2",GetLocation(GetWaypointByTag("WP_DYDD_MOVE_DUN")));
            DestroyObject(OBJECT_SELF,1.0);
        }
        else if (GetLocalInt(GetModule(),"NW_G_M2Q5DungeonEntered") == 10 &&
            GetLocalInt(OBJECT_SELF,"NW_L_Move") == 0)
        {
            ActionJumpToObject(GetWaypointByTag("WP_DYDD_MOVE_1"));
            ActionDoCommand(SetLocalInt(OBJECT_SELF,"NW_L_Move",10));
            ActionDoCommand(SetLocalInt(OBJECT_SELF,"NW_L_DungeonEntrance",10));
        }
        else if (GetLocalInt(OBJECT_SELF,"NW_L_Move") == 10)
        {
            if (GetDistanceToObject(GetWaypointByTag("WP_DYDD_MOVE_2")) > 3.0)
            {
                ClearAllActions();
                ActionMoveToObject(GetWaypointByTag("WP_DYDD_MOVE_2"));
            }
            else
            {
                SetLocalInt(OBJECT_SELF,"NW_L_Move",20);
            }
        }
    }
}
