//::///////////////////////////////////////////////
//:: Conversation
//:: m2q6NobleFlee
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The Noble calls for the guards and runs away.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 9, 2001
//:://////////////////////////////////////////////

void main()
{
    object oStairs = GetWaypointByTag("WP_M2Q6L_M2Q6K");
    CreateObject(OBJECT_TYPE_CREATURE,"M2Q06CNOBGUARD",GetLocation(oStairs));
    ActionMoveToObject(oStairs,TRUE);
}
