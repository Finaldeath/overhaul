//::///////////////////////////////////////////////
//:: Start the kobold-jumping sequence (fired from Master-Jumper's dialog)
//:: q5_jumping
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    for each kobold jumper:
    1. run to the top of the platform.
    2. destroy-self.
    3. Create jumping-kobold spell-effect.
    4. Adjust platform and boulder heights.
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 18/2/2003
//:://////////////////////////////////////////////

#include "q5_inc_plot"
void main()
{
    object oCaster = GetObjectByTag("Q5A_JUMP_CASTER");

    if (GetLocalInt(oCaster, "X1_KoboldJumpOnce") == 1)
        return;

    SetLocalInt(oCaster, "X1_KoboldJumpOnce", 1);
    object oWP1 = GetWaypointByTag("Q5_WP_JUMPER_RUN1");
    object oWP2 = GetWaypointByTag("Q5_WP_JUMPER_RUN2");
    object oWP3 = GetWaypointByTag("Q5_WP_JUMPER_RUN3");
    object oWP4 = GetWaypointByTag("Q5_WP_JUMPER_RUN4");
    string sBaseTag = "Q5_WP_JUMPER";

    object oPC = GetPCSpeaker();

    int i = 7;
    object oJumper;
    object oWP;
    string sTag;
    float fWait = 0.0;
    for(i = 7; i >= 1; i--)
    {
        sTag = sBaseTag + IntToString(i);
        oWP = GetWaypointByTag(sTag);
        oJumper = GetNearestObjectByTag("Q5_KOBOLD_JUMPER", oWP);
        AssignCommand(oJumper, ClearAllActions());
        AssignCommand(oJumper, ActionWait(fWait));
        AssignCommand(oJumper, ActionMoveToObject(oWP1, TRUE));
        AssignCommand(oJumper, ActionMoveToObject(oWP2, TRUE));
        AssignCommand(oJumper, ActionMoveToObject(oWP3, TRUE));
        AssignCommand(oJumper, ActionDoCommand(SpeakOneLinerConversation("q5_kobold_jump")));
        AssignCommand(oJumper, ActionMoveToObject(oWP4, TRUE));
        AssignCommand(oJumper, ActionDoCommand(SignalEvent(oCaster, EventUserDefined(101))));
        //Try to have jumper fade out faster
        //AssignCommand(oJumper, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oJumper));
        //5secs to run for # 1, 8 secs for last 1
        //DelayCommand(fWait + 7.0 + 3.0/IntToFloat(i),ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oJumper));
        AssignCommand(oJumper, ActionDoCommand(DestroyObject(oJumper)));
        AssignCommand(oJumper, SetCommandable(FALSE, oJumper));

        //Have PC play sounds
        //DelayCommand(fWait + 6.0 + 3.0/IntToFloat(i), AssignCommand(oPC, PlaySound("as_an_koboldwee")));
        //DelayCommand(fWait + 7.5 + 3.0/IntToFloat(i), AssignCommand(oPC, PlaySound("as_sw_pulybucket")));

        fWait += 3.0;
    }
    SetPlot("jt_q5blocked", 100, oPC);
}
