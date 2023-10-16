//::///////////////////////////////////////////////
//:: Heartbeat
//:: M2Q5Gorkan_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script is used to move Gorkan to the
    dungeon entrance and later on into the dungeon
    itself.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: October 9, 2001
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF,"NW_L_HEARTBEAT") == 0)
    {
        // Gorkan jumps into the dungeon entrance and walks toward Jaroo
        if (GetLocalInt(GetModule(),"NW_G_M2Q5DungeonEntered") == 10 &&
            GetLocalInt(OBJECT_SELF,"NW_L_Move") == 0)
        {
            ActionJumpToObject(GetWaypointByTag("WP_GORKAN_MOVE_1"));
            ActionDoCommand(SetLocalInt(OBJECT_SELF,"NW_L_Move",10));
            ActionDoCommand(SetLocalInt(OBJECT_SELF,"NW_L_DungeonEntrance",10));
        }
        else if (GetLocalInt(OBJECT_SELF,"NW_L_Move") == 10)
        {
            if (GetDistanceToObject(GetWaypointByTag("WP_GORKAN_MOVE_2")) > 3.0)
            {
                ClearAllActions();
                ActionMoveToObject(GetWaypointByTag("WP_GORKAN_MOVE_2"));
            }
            else
            {
                SetLocalInt(OBJECT_SELF,"NW_L_Move",20);
                SetLocalInt(OBJECT_SELF,"NW_L_DungeonEntrance",10);
            }
        }
    }
}
