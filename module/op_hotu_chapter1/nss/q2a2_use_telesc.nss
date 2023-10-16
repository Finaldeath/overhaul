//::///////////////////////////////////////////////
//:: Name: q2a2_use_telesc
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Start cutscene 10 (University Battle) when
     the telescope is played.  Only one person
     at a time should be able to use the telescope
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Dec 12, 2002
//:://////////////////////////////////////////////

#include "x0_i0_henchman"
void MakeLightGreen(location lLoc);
void MakeLightRed(location lLoc);
void RemoveHenchMen(object oPC);

void main()
{
    object oTelescope = GetObjectByTag("cut10_telescope");
    object oPC = GetLastUsedBy();

    // Set the telescope as "in-use"
    SetLocalInt(GetModule(), "nUniTelescopeUsed", 1);
    // Make a red light to show it is in use.
    MakeLightRed(GetLocation(oTelescope));
    DelayCommand(92.0, SetLocalInt(GetModule(), "nUniTelescopeUsed", 0));
    DelayCommand(92.0, AssignCommand(GetObjectByTag("cut10_door1"), ActionCloseDoor(OBJECT_SELF)));
    DelayCommand(92.0, AssignCommand(GetObjectByTag("cut10_door2"), ActionCloseDoor(OBJECT_SELF)));
    // Make a green light again, to show it is ready for use.
    DelayCommand(92.0, MakeLightGreen(GetLocation(oTelescope)));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_UNSUMMON), oPC);
    DelayCommand(2.0, AssignCommand(oPC, JumpToLocation(GetLocation(GetWaypointByTag("wp_cut10_start")))));

    DelayCommand(1.5, RemoveHenchMen(oPC));
}

void MakeLightGreen(location lLoc) {
     DestroyObject(GetObjectByTag("cut10_red_l"));
     CreateObject(OBJECT_TYPE_PLACEABLE, "cut10_green_l", lLoc);
}

void MakeLightRed(location lLoc) {
     DestroyObject(GetObjectByTag("cut10_green_l"));
     CreateObject(OBJECT_TYPE_PLACEABLE, "cut10_red_l", lLoc);
}

void RemoveHenchMen(object oPC)
{
    object oHench = GetHenchman(oPC);
    while (GetIsObjectValid(oHench) == TRUE)
    {
        FireHenchman(oPC, oHench);
        oHench = GetHenchman(oPC);
    }
}
