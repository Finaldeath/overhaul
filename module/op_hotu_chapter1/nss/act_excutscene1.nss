//::///////////////////////////////////////////////
//:: act_excutscene1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
 Stops the dialog after the Matron kills the victim and makes her say her last line
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "x0_inc_cuts"

void main()
{
    object oMatron = GetObjectByTag("maintownmat");

    AssignCommand(oMatron, ActionAttack(cutSceneGetVictim("execution")));
    SetPlotFlag(cutSceneGetVictim("execution"), FALSE);
    DelayCommand(0.6, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectDeath(),cutSceneGetVictim("execution")));
    DelayCommand(1.0, AssignCommand(oMatron, ClearAllActions()));
    DelayCommand(1.2, AssignCommand(oMatron, SpeakOneLinerConversation()));
    DelayCommand(4.0, ExecuteScript("act_teleport", oMatron));
}
