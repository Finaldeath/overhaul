//::///////////////////////////////////////////////
//:: Name h4b_lever_pull
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will cause the statues to shoot beams
     at the center statue.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 5, 2003
//:://////////////////////////////////////////////
#include "mimic_inc"
// Beam effects for the statues.
void MakeBeams(object oMimic, location lLoc);
// Destroy the objects that create the levers and effects.
void DestroyWaypoints();
// Kill all of the beams once the door is gone.
void DestroyBeams();

void main()
{
    // The mimic.
    object oMimic = GetObjectByTag("hx_mimic");
    location lLoc = GetLocation(GetObjectByTag("h4b_mimic_final_wp"));

    int iPulled = GetLocalInt(OBJECT_SELF, "HXPulled");
    int iTotalPulled;

    // Extra explosion locations.
    location lLoc1 = GetLocation(GetObjectByTag("h4c_explosion_wp"));
    location lLoc2 = GetLocation(GetObjectByTag("h4c_explosion_wp", 1));
    location lLoc3 = GetLocation(GetObjectByTag("h4c_explosion_wp", 2));
    location lLoc4 = GetLocation(GetObjectByTag("h4c_explosion_wp", 3));

    // Only pullable once.
    if(iPulled == 0)
    {
        SetLocalInt(OBJECT_SELF, "HXPulled", 1);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectCutsceneParalyze(), GetLastUsedBy(), 2.8);
        // Count how many have been pulled.
        iTotalPulled = GetLocalInt(GetArea(OBJECT_SELF), "HXTotalPulled");
        SetLocalInt(GetArea(OBJECT_SELF), "HXTotalPulled", iTotalPulled + 1);
        // Destroy the waypoints so no more levers appear.
        DestroyWaypoints();
        PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
        // Make the appropriate beams.
        DelayCommand(0.5, MakeBeams(oMimic, lLoc));
        // Reset switch.
        DelayCommand(1.5, PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
        DelayCommand(2.7, DestroyObject(OBJECT_SELF));
    }
    //else
    //    SpeakString("[NOT IN STRING EDITOR] The lever cannot be pulled again.");
}

void MakeBeams(object oMimic, location lLocWP)
{
    object oInvis1 = GetNearestObjectByTag("h4b_invis_beam", OBJECT_SELF, 1);
    object oInvis2 = GetNearestObjectByTag("h4b_invis_beam", OBJECT_SELF, 2);
    object oCenter = GetNearestObjectByTag("h4b_invis_beam_center");
    object oFinal = GetObjectByTag("h4b_invis_beam_center_final");
    int iTotalPulled = GetLocalInt(GetArea(OBJECT_SELF), "HXTotalPulled");

    object oFinalCenter1 = GetObjectByTag("h4b_invis_beam_center");
    object oFinalCenter2 = GetObjectByTag("h4b_invis_beam_center", 1);

    // Final door where the beams focus.
    object oDoor = GetObjectByTag("h4b_final_door");
    location lLoc = GetLocation(oDoor);

    // SFX
    object oSound = GetNearestObjectByTag("h4b_beam_sound");

    // Create the beam to the center.
    SoundObjectPlay(oSound);
    DelayCommand(0.1, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FLAME_M), GetNearestObjectByTag("hx_mimic_explode")));
    DelayCommand(0.4, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_SILENT_FIRE, oInvis1, BODY_NODE_CHEST), oCenter));
    DelayCommand(0.4, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_SILENT_FIRE, oInvis2, BODY_NODE_CHEST), oCenter));


    // Check to see if puzzle is done (all switches pulled).
    if(iTotalPulled >= 4)
    {
        // Turn the Mimic AI off and jump him into place.
        //SetMimicAI(oMimic, 0);
        //AssignCommand(oMimic, ClearAllActions());
        //DelayCommand(0.2, AssignCommand(oMimic, JumpToLocation(lLocWP)));
        SignalEvent(oMimic, EventUserDefined(4567));
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DIVINE_STRIKE_FIRE), GetLocation(GetNearestObjectByTag("hx_mimic_explode", OBJECT_SELF, 2)));
        DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_SILENT_FIRE, oFinal, BODY_NODE_CHEST), oFinalCenter1));
        DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_SILENT_FIRE, oFinal, BODY_NODE_CHEST), oFinalCenter2));
        DelayCommand(1.0, DestroyObject(oDoor));
        DelayCommand(1.3, DestroyBeams());
        DelayCommand(1.7, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIREBALL), lLoc));
        DelayCommand(2.1, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIREBALL), lLoc));
    }
}

// Destroy the objects that create the levers and effects.
void DestroyWaypoints()
{
    object oWP;
    object oWPOn = GetNearestObjectByTag("h4a_ring_wp", OBJECT_SELF);
    object oWPOff = GetNearestObjectByTag("h4a_ringoff_wp", OBJECT_SELF);

    if(GetDistanceToObject(oWPOn) < GetDistanceToObject(oWPOff))
        oWP = oWPOn;
    else
        oWP = oWPOff;

    DestroyObject(GetNearestObjectByTag("h4b_invis_lever"));
    DestroyObject(oWP);
}

// Kill all of the beams once the door is gone.
void DestroyBeams()
{
    int x = 0;
    int y = 0;

    object oInvis = GetNearestObjectByTag("h4b_invis_beam", OBJECT_SELF, x);
    object oCenter1 = GetObjectByTag("h4b_invis_beam_center");
    object oCenter2 = GetObjectByTag("h4b_invis_beam_center", 1);
    object oFinal = GetObjectByTag("h4b_invis_beam_center_final");
    object oSound = GetObjectByTag("h4b_beam_sound", y);

    // Turn off sounds.
    while(GetIsObjectValid(oSound))
    {
        SoundObjectStop(oSound);
        y = y + 1;
        oSound = GetObjectByTag("h4b_beam_sound", y);
    }

    // Kill beams.
    while(GetIsObjectValid(oInvis))
    {
        DestroyObject(oInvis);
        x = x + 1;
        oInvis = GetNearestObjectByTag("h4b_invis_beam", OBJECT_SELF, x);
    }

    DestroyObject(oCenter1);
    DestroyObject(oCenter2);
    DestroyObject(oFinal);
}
