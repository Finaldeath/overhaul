//::///////////////////////////////////////////////
//:: Name  q2d_onenter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On Enter of Level 3 - Get rid of any effects that
    may be carrying over from Level 2's anti magic areas

    Set up Level 3's wandering monsters

*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Nov 14/02
//:: UPDATED: June 9/03 - wandering monster setup
//:://////////////////////////////////////////////
#include "x2_inc_restsys"
void main()
{

        if (WMGetAreaHasTable(OBJECT_SELF) == FALSE)
        {
            WMSetAreaTable(OBJECT_SELF,"Undermountain3");

        }

        object oPC = GetEnteringObject();

        if (GetIsPC(oPC) == FALSE)
            return;

        if (GetLocalInt(OBJECT_SELF, "nDrowAmbush") == 1)
            return;

        //Do an autosave
        DoSinglePlayerAutoSave();

        //Start Drow Ambush
        SetLocalInt(OBJECT_SELF, "nDrowAmbush", 1);
        object oWaypoint = GetWaypointByTag("wp_q2d_StairsUp");
        object oDrow = GetObjectByTag("q2d_drowlookout1");
        AssignCommand(oDrow, ActionMoveToObject(oWaypoint));

        //Set up captured Formian Queen effects

        object oQueen = GetObjectByTag("x2_q2_formqueen");
        object oVFX1 = GetObjectByTag("q2d_formvfx_1");
        object oVFX2 = GetObjectByTag("q2d_formvfx_2");
        object oVFX3 = GetObjectByTag("q2d_formvfx_3");
        object oVFX4 = GetObjectByTag("q2d_formvfx_4");

        effect eBeam1 = EffectBeam(VFX_BEAM_LIGHTNING, oVFX1, BODY_NODE_CHEST);
        effect eBeam2 = EffectBeam(VFX_BEAM_LIGHTNING, oVFX2, BODY_NODE_CHEST);
        effect eBeam3 = EffectBeam(VFX_BEAM_LIGHTNING, oVFX3, BODY_NODE_CHEST);
        effect eBeam4 = EffectBeam(VFX_BEAM_LIGHTNING, oVFX4, BODY_NODE_CHEST);

        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBeam1, oQueen);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBeam2, oQueen);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBeam3, oQueen);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBeam4, oQueen);
}
