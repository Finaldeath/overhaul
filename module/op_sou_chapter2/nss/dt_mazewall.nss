//::///////////////////////////////////////////////
//:: Crypt Maze Wall (OnDeath)
//:: Dt_MazeWall.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Make the wall respawn in 9 secs.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 13, 2003
//:://////////////////////////////////////////////

void CreateFence(location lFence)
{
    effect eVFX = EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_GREASE);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, lFence);
    CreateObject(OBJECT_TYPE_PLACEABLE, "fencemaze", lFence, TRUE);
    CreateObject(OBJECT_TYPE_PLACEABLE, "fencemaze_invis", lFence, TRUE);
}

void main()
{
    object oArea = GetArea(OBJECT_SELF);
    object oFence = GetNearestObjectByTag("FenceMaze");
    effect eVFX = EffectVisualEffect(353);
    location lFence = GetLocation(oFence);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, lFence);
    DestroyObject(oFence);
    AssignCommand(oArea, DelayCommand(9.0, CreateFence(lFence)));
}
