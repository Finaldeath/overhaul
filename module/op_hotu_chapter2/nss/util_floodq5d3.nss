//::///////////////////////////////////////////////
//:: Name  : util_floodq5d3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Place water tiles throughout the level
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

//::///////////////////////////////////////////////
//:: Name: q5a_enter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On enter of this area - Do once - create Formian enclave
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On: Dec 9/02
//:://////////////////////////////////////////////


void main()
{
    // * flood area with tiles
    if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
        int nColumns = 15;

        int nRows = 15;

            // * put water everywhere
            vector vPos;
            vPos.x = 5.0;
            vPos.y = 0.0;
            vPos.z = 0.1;
            float fFace = 0.0;
            location lLoc;
            object oTile;
            int nRandom = Random(16) + 1;
            int nEffect = 426 + nRandom;
            effect eVis = EffectVisualEffect(nEffect);

            // * fill x axis
            int i, j;
            for (i=0 ; i <= nColumns; i++)
            {
                vPos.y = -5.0;
                // fill y
                for (j=0; j<= nRows; j++)
                {
                    vPos.y = vPos.y + 10.0;
                    lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
                    oTile = CreateObject(OBJECT_TYPE_PLACEABLE, "q5formiantile1", lLoc);
                    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oTile);
                    nRandom = Random(16) + 1;
                    nEffect = 426 + nRandom;
                    eVis = EffectVisualEffect(nEffect);

                }

                vPos.x = vPos.x + 10.0;
            }

    }

}
