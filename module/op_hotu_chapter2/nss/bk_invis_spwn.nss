//::///////////////////////////////////////////////
//:: bk_invis_spwn
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    First spawn apply darkness effect to
    obscure bridge
*/
//:://////////////////////////////////////////////
//:: Created By:Brent
//:: Created On:
//:://////////////////////////////////////////////

location AdjustPosition(location lOriginal, float zOffset, float xOffset, float yOffset)
{
    vector vPos = GetPositionFromLocation(lOriginal);
    object oArea = GetAreaFromLocation(lOriginal);
    float fFace = GetFacingFromLocation(lOriginal);
    vPos.z = vPos.z + zOffset;
    vPos.x = vPos.x + xOffset;
    vPos.y = vPos.y + zOffset;

    return Location(oArea, vPos, fFace);
}

void main()
{
    if (GetLocalInt(OBJECT_SELF, "cover") == 0)
    {
        SetLocalInt(OBJECT_SELF, "cover", 1);
        SignalEvent(OBJECT_SELF, EventUserDefined(11003));
        // * spawn upper and lower portions if the master creator
        if (GetLocalInt(OBJECT_SELF, "slave") != 1)
        {
          /*  string sResRef = GetResRef(OBJECT_SELF);
            location lSelf =  GetLocation(OBJECT_SELF);
            location lNewLoc = AdjustPosition(lSelf, 5.0, 0.0, 0.0);
            object oNew = CreateObject(OBJECT_TYPE_PLACEABLE, sResRef, lNewLoc);
            // * to prevent an infinite loop make sure this one won't spawn children
            SetLocalInt(oNew, "slave", 1);

            lNewLoc = AdjustPosition(lSelf, -5.0, 0.0, 0.0);
            oNew = CreateObject(OBJECT_TYPE_PLACEABLE, sResRef, lNewLoc);
            // * to prevent an infinite loop make sure this one won't spawn children
            SetLocalInt(oNew, "slave", 1);


            lNewLoc = AdjustPosition(lSelf, 15.0, 0.0, 0.0);
            oNew = CreateObject(OBJECT_TYPE_PLACEABLE, sResRef, lNewLoc);
            // * to prevent an infinite loop make sure this one won't spawn children
            SetLocalInt(oNew, "slave", 1); */

        }


    }
}
