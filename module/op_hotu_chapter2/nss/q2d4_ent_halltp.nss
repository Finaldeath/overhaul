//::///////////////////////////////////////////////
//:: Name: q2d4_ent_halltp
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

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;
    //if the PC just ported up from the City - do nothing
    if (GetLocalInt(oPC, "X2_Q2DTPFromCity") == 1)
    {
        SetLocalInt(oPC, "X2_Q2DTPFromCity", 0);
        //if the illithid are hostile - make some illusion effects
        if (GetLocalInt(GetModule(), "X2_Q2DIllithidHostile") > 0)
            ExecuteScript("q2d4_setupilsn", OBJECT_SELF);
        return;
    }

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
