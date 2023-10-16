//::///////////////////////////////////////////////
//:: Name act_q1aayala_6
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Everyone should turn towards Drogan - the three
    henchmen can start towards him a little bit..
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 6/03
//:://////////////////////////////////////////////

void main()
{
    object oXan = GetObjectByTag("x0_hen_xan");
    object oDorna = GetObjectByTag("x0_hen_dor");
    object oMischa = GetObjectByTag("x0_hen_mis");
    object oAyala = GetObjectByTag("Ayala");
    object oDrogan = GetObjectByTag("Drogan");

    AssignCommand(oAyala, SetFacingPoint(GetPosition(oDrogan)));
    AssignCommand(oDorna, ActionMoveToObject(oDrogan, TRUE));
    DelayCommand(1.5, AssignCommand(oDorna, ClearAllActions()));
    AssignCommand(oMischa, ActionMoveToObject(oDrogan, TRUE));
    DelayCommand(1.0, AssignCommand(oMischa, ClearAllActions()));
    AssignCommand(oXan, ActionMoveToObject(oDrogan, TRUE));
    DelayCommand(0.6, AssignCommand(oXan, ClearAllActions()));
}
