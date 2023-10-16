//::///////////////////////////////////////////////
//:: Name: q2d2_ent_halltp
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Warm up the teleporter - which will fire a
    User defined event to teleport the PC in 6
    seconds (if he's still in the trigger)
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On: July 31/03
//:://////////////////////////////////////////////
#include "x2_inc_globals"
void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;

   //if the PC just ported down from the grand hall - do nothing
    if (GetLocalInt(oPC, "X2_Q2D_HallToCity") == 1)
    {
        SetLocalInt(oPC, "X2_Q2D_HallToCity", 0);
        return;
    }
    object oGuard = GetObjectByTag("q2d_ill_guard1");
    if (GetIsObjectValid(oGuard) == FALSE && GetLocalInt(GetModule(),"elder_brain") < 2)
    {
        SetLocalInt(GetModule(), "X2_Q2DIllithidHostile", 1);
        //Activate Wandering Monsters
        object oArea = GetArea(OBJECT_SELF);
        SetLocalString(oArea,"X2_WM_ENCOUNTERTABLE", "ZorvakMur");
    }
    // if PC is cleared to teleport - do some Vfx
        //overmind is not dead AND                  (PC cleared for the hall OR Illithid are all hostile OR PC working for the brain
    //Bugfix: If working for the overmind, don't worry about the helmet. If you had attacked and killed the guard to get in initially,
    //        there was nobody to give the helmet to. So that made it kind of hard to get back in if you made a deal after that.
    if (GetLocalInt(GetModule(), "X2_Q2DKilledOvermind") == 0 && (GetLocalInt(GetModule(), "X2_Q2DPCClearedForHall") == 1 ||
            GetLocalInt(GetModule(), "X2_Q2DIllithidHostile") > 0 || (GetLocalInt(GetModule(),"elder_brain") > 0 && GetLocalInt(GetModule(), "elder_brain")< 3 /*&& GetLocalInt(oPC, "X2_Q2DGaveHelm") == 1*/)))
    {
        SetLocalString(OBJECT_SELF, "PCToTeleport", GetName(oPC));
        // and then Signal Teleport Event
        effect eVfx1 = EffectVisualEffect(VFX_FNF_DISPEL_GREATER);
        effect eVfx2 = EffectVisualEffect(134);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVfx2, GetLocation(OBJECT_SELF));
        DelayCommand(0.5, AssignCommand(oPC, PlaySound("sca_outmind01")));
        DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVfx2, GetLocation(OBJECT_SELF)));
        DelayCommand(1.0, AssignCommand(oPC, PlaySound("sca_outmind01")));
        DelayCommand(2.8, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVfx2, GetLocation(OBJECT_SELF)));
        DelayCommand(2.0, AssignCommand(oPC, PlaySound("sca_outmind01")));
        DelayCommand(3.8, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVfx2, GetLocation(OBJECT_SELF)));
        DelayCommand(3.2, AssignCommand(oPC, PlaySound("sca_outmind01")));
        DelayCommand(4.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVfx2, GetLocation(OBJECT_SELF)));
        DelayCommand(4.0, AssignCommand(oPC, PlaySound("sca_outmind01")));
        DelayCommand(5.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVfx2, GetLocation(OBJECT_SELF)));
        DelayCommand(5.4, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVfx2, GetLocation(OBJECT_SELF)));
        DelayCommand(5.7, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVfx2, GetLocation(OBJECT_SELF)));
        DelayCommand(5.9, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVfx2, GetLocation(OBJECT_SELF)));

        DelayCommand(4.5, SignalEvent(OBJECT_SELF, EventUserDefined(222)));
    }
    //else do some other kind of effects cause the teleporter won't work..
    else
    {
        effect eVfx2 = EffectVisualEffect(134);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVfx2, GetLocation(OBJECT_SELF));
        DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVfx2, GetLocation(OBJECT_SELF)));
        DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVfx2, GetLocation(OBJECT_SELF)));

        effect eVfxBad = EffectVisualEffect(VFX_IMP_RESTORATION_GREATER);
        DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVfxBad, GetLocation(OBJECT_SELF)));
        DelayCommand(2.0, FloatingTextStrRefOnCreature(85717, oPC));//"Nothing seems to happen."
    }

}
