//::///////////////////////////////////////////////
//:: Name  q2d_onenter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Set up Level 3's wandering monsters
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Nov 14/02
//:: UPDATED: June 9/03 - wandering monster setup
//:://////////////////////////////////////////////
#include "x2_inc_restsys"

void Setup(object oPC)
{


    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_SETUP_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_SETUP_ONCE", 1);

    object oPortalEnt = GetObjectByTag("q2d_portal_ent");
    effect eVis = EffectVisualEffect(VFX_DUR_ETHEREAL_VISAGE);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oPortalEnt);

    object oStone1 = GetObjectByTag("q2d_energy_stone1");
    object oStone2 = GetObjectByTag("q2d_energy_stone2");
    object oStone3 = GetObjectByTag("q2d_energy_stone3");

    eVis = EffectVisualEffect(VFX_DUR_PARALYZED);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oStone1);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oStone2);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oStone3);

    object oHalaster = GetObjectByTag("q2d_halaster");

    effect eBeam1 = EffectBeam(VFX_BEAM_SILENT_ODD, oStone1, BODY_NODE_HAND);
    effect eBeam2 = EffectBeam(VFX_BEAM_SILENT_ODD, oStone2, BODY_NODE_HAND);
    effect eBeam3 = EffectBeam(VFX_BEAM_SILENT_ODD, oStone3, BODY_NODE_HAND);

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBeam1, oHalaster);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBeam2, oHalaster);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBeam3, oHalaster);

    int i = 1;
    // for all flash sources - create an identical flasher a few meters above
    object oFlasher = GetNearestObjectByTag("q2d_energy_flash", oPC, i);
    location lLoc;
    vector vPos;
    while(oFlasher != OBJECT_INVALID)
    {
        vPos = GetPosition(oFlasher);
        vPos.z += 5;
        lLoc = Location(OBJECT_SELF, vPos, 0.0);
        if(GetLocalInt(oFlasher, "UP") == 1)
            CreateObject(OBJECT_TYPE_PLACEABLE, "invisobj", lLoc);
        i++;
        oFlasher = GetNearestObjectByTag("q2d_energy_flash", oPC, i);
    }

    // Signal the portal effect object to start (stopping the effect by destroying the object)
    object oPortalEffect = GetObjectByTag("q2d_portal_effect");
    SignalEvent(oPortalEffect, EventUserDefined(101));


}

void main()
{

        if (GetLocalInt(OBJECT_SELF,"X2_WM_AREA_INIT") != TRUE)
        {
            WMSetAreaTable(OBJECT_SELF,"Undermountain3");
            SetLocalInt(OBJECT_SELF,"X2_WM_AREA_INIT",TRUE);
        }

        object oEnter = GetEnteringObject();


        if (!GetIsPC(oEnter))
            return;

        //Add a check here for Nathyrra to rejoin the PC as a follower
        //if the PC left the area and came back
        object oNath = GetObjectByTag("x2_hen_nathyrra");
        if (GetIsObjectValid(oNath) == TRUE)
        {
            if (GetIsObjectValid(GetMaster(oNath)) == FALSE)
            {
                AddHenchman(oEnter, oNath);
                SetLocalInt(oNath, "X2_JUST_A_FOLLOWER", TRUE);
            }
        }

        // Using the PLAYERS_NUM var to knows whether there are any players in the area
        // and if there are then use the HB flashers event.
        int n = GetLocalInt(OBJECT_SELF, "PLAYERS_NUM");
        n++;
        SetLocalInt(OBJECT_SELF, "PLAYERS_NUM", n);
        Setup(oEnter);

        if (GetLocalInt(OBJECT_SELF, "nSaved") == 1)
            return;

        SetLocalInt(OBJECT_SELF, "nSaved", 1);
        DoSinglePlayerAutoSave();

}
