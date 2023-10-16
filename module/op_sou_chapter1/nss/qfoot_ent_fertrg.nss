//::///////////////////////////////////////////////
//:: Name qfoot_ent_fertrg
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When a PC enters the trigger - Ferran will greet
    them.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 19/03
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPlayerCharacter(oPC) == TRUE)
    {
        object oFerran = GetObjectByTag("q1ferran");
        AssignCommand(oFerran, SetFacingPoint(GetPosition(oPC)));
        AssignCommand(oFerran, SpeakStringByStrRef(40262));
        AssignCommand(oFerran, ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING));
        AssignCommand(oPC, PlaySound("vs_fov_hen3m_hi"));
        DestroyObject(OBJECT_SELF, 2.0);

    }
}
