//::///////////////////////////////////////////////
//:: Name hx_gen_onenter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This is the generic onenter script for "ring
     vision" areas.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: July 15, 2003
//:://////////////////////////////////////////////
#include "hx_inc_ring"
void main()
{
    object oPC = GetEnteringObject();

    if(GetIsPC(oPC)) {
    // Do once
    if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1)
    {

        SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
        DoSinglePlayerAutoSave();
        // Put lava in tiles.
        vector vPos;
        vPos.x = 55.0;
        vPos.y = 85.0;
        vPos.z = 0.0;
        float fFace = 0.0;
        location lLoc;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 55.0;
        vPos.y = 95.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 55.0;
        vPos.y = 105.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 55.0;
        vPos.y = 115.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 65.0;
        vPos.y = 85.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 65.0;
        vPos.y = 95.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 65.0;
        vPos.y = 105.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 65.0;
        vPos.y = 115.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);
    }
    }

    //"Ring effect" check
    DelayCommand(0.5, HXAreaEnter(oPC));
}
