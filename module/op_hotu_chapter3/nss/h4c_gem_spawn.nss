//::///////////////////////////////////////////////
//:: Name h4c_gem_spawn
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will create a gem upon impact. Used for
     the 2da for the gem spell.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: July 30, 2003
//:://////////////////////////////////////////////

void main()
{
    object oSpawner = GetNearestObjectByTag("h4c_gem_thrower");
    location lLoc = GetLocalLocation(oSpawner, "gem_target");

    CreateObject(OBJECT_TYPE_PLACEABLE, "hx_mimic_pcgem", lLoc);
}
