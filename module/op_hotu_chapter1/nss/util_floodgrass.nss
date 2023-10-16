//::///////////////////////////////////////////////
//:: Name util_floodgrass
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Flood the 'Hunting Grounds' area of the Realm
    of the reaper with grass tiles..
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 14/03
//:://////////////////////////////////////////////
#include "inc_plot_func"

int nColumns = 4;
int nRows = 14;
void main()
{
    // * put fire everywhere
    vector vPos;
    vPos.x = 0.0;
    vPos.y = 0.0;
    vPos.z = 0.0;
    float fFace = 0.0;
    location lLoc;
    location lNewLoc;
    int nEffect = 402;
    effect eVis = EffectVisualEffect(nEffect);

    // * fill x axis
    int i,j = 0;
    for (i=0 ; i <= nColumns; i++)
    {
        vPos.y = 5.0;
        // fill y
        for (j=0; j<= nRows; j++)
        {
            vPos.y = vPos.y + 10.0;
            lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
            lNewLoc = GetAdjustLocation(0.10, lLoc);
            object oNew = CreateObject(OBJECT_TYPE_PLACEABLE, "q5grasstile", lNewLoc);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oNew);
        }
        vPos.x = vPos.x + 10.0;
    }

}

