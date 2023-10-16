//::///////////////////////////////////////////////
//:: Witch's Wake: Elkentree Hole Spawn
//:: WW1_Elktree_Hole.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Spawns in the non-usable version of the hole.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 30, 2002
//:://////////////////////////////////////////////

void main()
{
    //Spawn in a generic hole.
    location lLoc = GetLocation(OBJECT_SELF);
    CreateObject(OBJECT_TYPE_PLACEABLE, "ww1_statichole", lLoc);
}
