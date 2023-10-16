//::///////////////////////////////////////////////
//:: Name: h4a_onenter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On enter of this area.  Turns certain pit
    tiles to lava.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: July 18, 2003
//:://////////////////////////////////////////////
#include "hx_inc_ring"
#include "x2_inc_toollib"
void main()
{

    object oPC = GetEnteringObject();

    if(GetIsPC(oPC)) {
    // Do once
    if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1)
    {

        while(GetImmortal(oPC) == TRUE)
        {
            SetImmortal(oPC, FALSE);
        }
        while(GetPlotFlag(oPC) == TRUE)
        {
            SetPlotFlag(oPC, FALSE);
        }

        SetLocalInt(OBJECT_SELF, "nDoOnce", 1);

        int nColumns = 12;
        int nRows = 12;

        TLChangeAreaGroundTiles(OBJECT_SELF, X2_TL_GROUNDTILE_LAVA, nColumns, nRows, -1.0);
        // Put lava in tiles.
       /* vector vPos;
        vPos.x = 5.0;
        vPos.y = 105.0;
        vPos.z = 0.0;
        float fFace = 0.0;
        location lLoc;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 15.0;
        vPos.y = 105.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 25.0;
        vPos.y = 105.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 35.0;
        vPos.y = 105.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 45.0;
        vPos.y = 105.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 55.0;
        vPos.y = 105.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 65.0;
        vPos.y = 105.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);
        /*
        vPos.x = 75.0;
        vPos.y = 105.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 85.0;
        vPos.y = 105.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 95.0;
        vPos.y = 105.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);
        */
///////////////////////////////////////////////////////////////////////
        /*
        vPos.x = 5.0;
        vPos.y = 115.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 15.0;
        vPos.y = 115.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 25.0;
        vPos.y = 115.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 35.0;
        vPos.y = 115.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 45.0;
        vPos.y = 115.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

/////////////////////////////////////////////////////////////////

        /*
        vPos.x = 5.0;
        vPos.y = 95.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 15.0;
        vPos.y = 95.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 25.0;
        vPos.y = 95.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);
        *//*
        vPos.x = 35.0;
        vPos.y = 95.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 45.0;
        vPos.y = 95.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 55.0;
        vPos.y = 95.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 65.0;
        vPos.y = 95.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 75.0;
        vPos.y = 95.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 85.0;
        vPos.y = 95.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 95.0;
        vPos.y = 95.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

///////////////////////////////////////////////////////////////////////
        /*
        vPos.x = 5.0;
        vPos.y = 85.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 15.0;
        vPos.y = 85.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 25.0;
        vPos.y = 85.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 35.0;
        vPos.y = 85.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 45.0;
        vPos.y = 85.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);
        */ /*
        vPos.x = 55.0;
        vPos.y = 85.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 65.0;
        vPos.y = 85.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 75.0;
        vPos.y = 85.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 85.0;
        vPos.y = 85.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 95.0;
        vPos.y = 85.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 105.0;
        vPos.y = 85.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 115.0;
        vPos.y = 85.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

///////////////////////////////////////////////////////////////////////
        /*
        vPos.x = 5.0;
        vPos.y = 75.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 15.0;
        vPos.y = 75.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 25.0;
        vPos.y = 75.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 35.0;
        vPos.y = 75.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 45.0;
        vPos.y = 75.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 55.0;
        vPos.y = 75.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 65.0;
        vPos.y = 75.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 75.0;
        vPos.y = 75.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);
        *//*
        vPos.x = 85.0;
        vPos.y = 75.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 95.0;
        vPos.y = 75.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 105.0;
        vPos.y = 75.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 115.0;
        vPos.y = 75.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

///////////////////////////////////////////////////////////////////////
       /*
        vPos.x = 5.0;
        vPos.y = 65.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 15.0;
        vPos.y = 65.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 25.0;
        vPos.y = 65.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 35.0;
        vPos.y = 65.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 45.0;
        vPos.y = 65.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 55.0;
        vPos.y = 65.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 65.0;
        vPos.y = 65.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 75.0;
        vPos.y = 65.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 85.0;
        vPos.y = 65.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);

        vPos.x = 95.0;
        vPos.y = 65.0;
        vPos.z = 0.0;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lLoc);
        */

    }
  }

    // Added "ring effect" check
    DelayCommand(0.5, HXAreaEnter(oPC));
}
