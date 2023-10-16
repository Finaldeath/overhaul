// Cultist converge on player, fade to black and jump to inside the temple.

int CUTSCENE_NUMBER = 31;

#include "x2_inc_cutscene"
#include "x0_i0_anims"
#include "nw_i0_plot"
#include "x2c2_inc_plot"


void CallBeginConversation2(int nCutscene, object oTalker, object oTalkTo, string sConvFile)
{
        if(nCutscene == GetLocalInt(oTalker, "nCutsceneNumber"))
        {

            if(IsInConversation(oTalker) || GetLocalInt(oTalkTo, "TALK_STARTED") == 1)
            {

                return;
            }
            AssignCommand(oTalker, Talk(sConvFile, oTalkTo));
        }
}

void CutBeginConversation2(float fDelay, object oTalker, object oTalkTo, string sConvFile, int iShift = TRUE)
{
    int nCutscene = GetActiveCutsceneNum();
    fDelay = CutCalculateCurrentDelay(fDelay, nCutscene);
    DelayCommand(fDelay, DelayCommand(GetShift(oTalker, iShift), CallBeginConversation2(nCutscene, oTalker, oTalkTo, sConvFile)));
}

void main()
{
    object oPC = GetPCSpeaker();
    SetPlot("q3_dracolich", 20);
    object oCopyJump = GetWaypointByTag("q3b_wp_cutjump");
    object oArmandJump = GetWaypointByTag("q3b_wp_cutjump1");
    object oCultist1Jump = GetWaypointByTag("q3b_wp_cutjump2");
    object oCultist2Jump = GetWaypointByTag("q3b_wp_cutjump3");
    object oPCJump = GetWaypointByTag("q3b_wp_cutjump4");
    object oCopy = GetLocalObject(oPC, "q2a_copy");
    // cutscene 31 is still active, but changing delay type.
    CutSetActiveCutscene(CUTSCENE_NUMBER, CUT_DELAY_TYPE_CUMULATIVE, FALSE);
    object oCultist1 = GetNearestObjectByTag("q3a_cultist1");
    object oCultist2 = GetNearestObjectByTag("q3a_cultist2");
    //CutDisableAbort(CUTSCENE_NUMBER);
    CutActionMoveToObject(0.0, oCultist1, oCopy, TRUE);
    CutActionMoveToObject(0.0, oCultist2, oCopy, TRUE);

    int i = 1;
    object oSlave = GetNearestObjectByTag("Q3A_SLAVE", oPC, i);
    while(i <= 8)
    {
        DelayCommand(9.0, AssignCommand(oSlave, SetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS, TRUE)));
        i++;
        oSlave = GetNearestObjectByTag("Q3A_SLAVE", oPC, i);
    }


    CutJumpToObject(1.5, oPC, oPCJump);
    CutJumpToObject(0.0, oCopy, oCopyJump);
    CutJumpToObject(0.0, OBJECT_SELF, oArmandJump);
    CutJumpToObject(0.0, oCultist1, oCultist1Jump);
    CutJumpToObject(0.0, oCultist2, oCultist2Jump);
    CutFadeOutAndIn(0.0, oPC, 4.0, FADE_SPEED_FAST);
    SetLocalInt(OBJECT_SELF, "q3_conv_status", 1);
    CutSetFacingPoint(0.0, OBJECT_SELF, "q3a_cultist1");
    CutSetCamera(2.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 12.0, 50.0, CAMERA_TRANSITION_TYPE_VERY_SLOW);
    CutBeginConversation2(4.5, oCultist1, OBJECT_SELF, "q3vil_cut_armand");
    CutBeginConversation2(6.0, oCultist1, OBJECT_SELF, "q3vil_cut_armand");
    CutBeginConversation2(8.0, oCultist1, OBJECT_SELF, "q3vil_cut_armand");
    CutBeginConversation2(10.0, oCultist1, OBJECT_SELF, "q3vil_cut_armand");
    CutBeginConversation2(12.0, oCultist1, OBJECT_SELF, "q3vil_cut_armand");
    // Destroy the traps at the entrance to the temple
    object oTrap1 = GetObjectByTag("q3b_entrance_trap1");
    object oTrap2 = GetObjectByTag("q3b_entrance_trap2");
    object oTrap3 = GetObjectByTag("q3b_entrance_trap3");
    DestroyObject(oTrap1);
    DestroyObject(oTrap2);
    DestroyObject(oTrap3);
    Reward_2daXP(oPC, 18);

    //CutDisableCutscene(CUTSCENE_NUMBER, 5.0, 0.0, RESTORE_TYPE_NONE);
}
