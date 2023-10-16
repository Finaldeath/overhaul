//::///////////////////////////////////////////////
//:: Name  : q2d1_enter_area
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Place a couple illusion tiles on the level
    4,1 and 5,1
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 30/03
//:://////////////////////////////////////////////

#include "nw_i0_generic"
void MakeHostile(object oPC);

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE)
    {

        //if the PC has made the illithid hostile.
        if (GetLocalInt(GetModule(), "X2_Q2DIllithidHostile") > 0)
            MakeHostile(oPC);

        if (GetLocalInt(OBJECT_SELF, "nAutoSave") != 1)
        {
            SetLocalInt(OBJECT_SELF, "nAutoSave", 1);
            DoSinglePlayerAutoSave();
        }

    }

    // * Place any illusionary tiles we need to set up
    if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1)
    {


        SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
        int nColumns = 0;

        int nRows = 0;

            // *
            vector vPos;
            vPos.x = 20.0;
            vPos.y = 80.0;
            vPos.z = 0.1;
            float fFace = 0.0;
            location lLoc;
            object oTile;

            int nEffect = 428;  //427 - 431    EffectVisualEffect(428) - Waterfall
            effect eVis = EffectVisualEffect(nEffect);

            // * fill x axis
            int i, j;
            for (i=0 ; i <= nColumns; i++)
            {
                vPos.y = 40.0;
                // fill y
                for (j=0; j<= nRows; j++)
                {
                    vPos.y = vPos.y + 10.0;
                    lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
                    oTile = CreateObject(OBJECT_TYPE_PLACEABLE, "q2dfencetile", lLoc, FALSE, "q2d1_vfx_waterfall");
                    AssignCommand(oTile, SetFacing(180.0));
                    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oTile);

                }

                vPos.x = vPos.x + 10.0;
            }

    }

}

//Make all illithid and thralls in the area hostile to the PC
void MakeHostile(object oPC)
{
    AddJournalQuestEntry("q2_zorvakmur",60,oPC);
    //All illithid in this area will turn hostile.
    object oMind = GetObjectByTag("q2dgatekeepr");
    string szTag;
    ChangeToStandardFaction(oMind, STANDARD_FACTION_HOSTILE);
    AssignCommand(oMind, DetermineCombatRound());
    object oThrall = GetFirstObjectInArea();
    while (oThrall != OBJECT_INVALID)
    {
        szTag = GetTag(oThrall);
        if (GetStringLeft(szTag, 9) == "q2dthrall")
        {
            if (GetLocalInt(oThrall, "nFreed") != 1)
            {
                ChangeToStandardFaction(oThrall, STANDARD_FACTION_HOSTILE);
                AssignCommand(oThrall, DetermineCombatRound());
            }
        }
        else if (GetStringLeft(szTag, 7) == "q2d_ill")
        {
            ChangeToStandardFaction(oThrall, STANDARD_FACTION_HOSTILE);
            AssignCommand(oThrall, DetermineCombatRound());
        }

        oThrall = GetNextObjectInArea();
    }
}
