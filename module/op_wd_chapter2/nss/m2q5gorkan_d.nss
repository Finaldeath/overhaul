//::///////////////////////////////////////////////
//:: User Defined
//:: m2q5gorkan_d
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Gorkan moves to the third level of Mutamin's
    challenge.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 18, 2002
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF,"NW_L_Dungeon") == 0 &&
        GetLocalInt(GetModule(),"NW_G_GorkanHostile") == 10)
    {
        ClearAllActions();
        SetLocalInt(OBJECT_SELF,"NW_L_Dungeon",10);
        SetLocalInt(OBJECT_SELF,"NW_L_Move",20);
        JumpToLocation(GetLocation(GetWaypointByTag("WP_GORKAN_MOVE_DUN")));
        DelayCommand(1.0,AdjustReputation(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC),OBJECT_SELF,-100));
    }
}
