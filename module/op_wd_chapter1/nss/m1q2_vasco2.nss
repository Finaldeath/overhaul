//::///////////////////////////////////////////////
//:: Vasco's Bloodsailor Spawn
//:: m1q2_Vasco2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Through conversation with Vasco, the
    Bloodsailor destroys himself and spawns in
    another version of himself.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 20, 2001
//:://////////////////////////////////////////////

void main()
{
    DestroyObject(OBJECT_SELF);

// Check to see if a Bloodsailor already exists.
    object oBloodsailor = GetObjectByTag("m1q2_Bloodsail");

    if(!GetIsObjectValid(oBloodsailor));
    {
// If not, spawn in Bloodsailor at the Spawn Point.
        object oSpawnPoint = GetObjectByTag("m1q2_BloodSpawn");
        location lSpawnPoint = GetLocation(oSpawnPoint);

        CreateObject(OBJECT_TYPE_CREATURE, "m1q2_Bloodsail", lSpawnPoint);
    }
}
