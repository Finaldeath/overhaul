//::///////////////////////////////////////////////
//:: Name: q4a_area_enter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On enter of this area.  Turns certain water
    tiles to lava.

    This script will also create the healing rods
    and apply effects to them.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 3, 2003
//:://////////////////////////////////////////////
void MakeGlow(object oPC);

void main()
{

    object oPC = GetEnteringObject();

    if(GetIsPC(oPC)) {
    // Do once
    if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
        // Put lava in tiles.
        vector vPos;
        vPos.x = 95.0;
        vPos.y = 5.0;
        vPos.z = 0.0;
        float fFace = 0.0;
        location lLoc;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 95.0;
        vPos.y = 15.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 95.0;
        vPos.y = 25.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 95.0;
        vPos.y = 35.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 95.0;
        vPos.y = 45.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);
        //
        vPos.x = 105.0;
        vPos.y = 5.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 105.0;
        vPos.y = 15.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 105.0;
        vPos.y = 25.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 105.0;
        vPos.y = 35.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 105.0;
        vPos.y = 45.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);
        //
        vPos.x = 115.0;
        vPos.y = 15.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 115.0;
        vPos.y = 25.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 115.0;
        vPos.y = 35.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 115.0;
        vPos.y = 45.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 115.0;
        vPos.y = 55.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);
        //
        vPos.x = 125.0;
        vPos.y = 15.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 125.0;
        vPos.y = 25.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 125.0;
        vPos.y = 35.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 125.0;
        vPos.y = 45.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 125.0;
        vPos.y = 55.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 125.0;
        vPos.y = 65.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);
        //
        vPos.x = 135.0;
        vPos.y = 55.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 135.0;
        vPos.y = 65.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);
        //
        vPos.x = 145.0;
        vPos.y = 55.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 145.0;
        vPos.y = 65.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);
        //

       // Create the heal rods.
       int x = 1;
       object oRod = GetNearestObjectByTag("q4a_heal_wp", oPC, x);

       while(oRod != OBJECT_INVALID) {
          CreateObject(OBJECT_TYPE_PLACEABLE, "birdbath001", GetLocation(oRod));
          x = x + 1;
          oRod = GetNearestObjectByTag("q4a_heal_wp", oPC, x);
       }
       DelayCommand(2.0, MakeGlow(oPC));
       }
   }
}

// Adds an anti-glow around the heal rods.
void MakeGlow(object oPC) {
       int x = 1;
       object oRod = GetNearestObjectByTag("q4a_heal_rod", oPC, x);

       while(oRod != OBJECT_INVALID) {
          ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_ANTI_LIGHT_10), oRod);
          x = x + 1;
          oRod = GetNearestObjectByTag("q4a_heal_rod", oPC, x);
       }
}
