// Player tries to attack Armand:
// - A powerful force drops the player to the ground for 1 second
// - Armand orders the monks to attack and teleports away
// - Monks charge.
// - All villagers flee the court screaming.

#include "x2_inc_cutscene"
#include "x0_i0_anims"
#include "x2c2_inc_plot"

int CUTSCENE_NUMBER = 31;

void main()
{
    object oPC = GetPCSpeaker();
    SetPlot("q3_dracolich", 30);
    object oSac = GetNearestObjectByTag("q3a_sacrifice");
    object oCultist1 = GetNearestObjectByTag("q3a_cultist1");
    object oCultist2 = GetNearestObjectByTag("q3a_cultist2");
    object oGong = GetObjectByTag("q3a_gong");
    CutSetActiveCutscene(CUTSCENE_NUMBER, CUT_DELAY_TYPE_CONSTANT, FALSE);
    object oArmandJump = GetWaypointByTag("q3_wp_armand_sp");
    object oCopy = GetLocalObject(oPC, "q2a_copy");
    CutDisableAbort(CUTSCENE_NUMBER);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 270.0, 20.0, 40.0, CAMERA_TRANSITION_TYPE_SLOW);
    CutPlayVoiceChat(0.0, oCopy, VOICE_CHAT_BATTLECRY2);
    CutActionMoveToObject(0.0, oCopy, OBJECT_SELF, TRUE);
    CutPlayAnimation(0.5, OBJECT_SELF, ANIMATION_LOOPING_CONJURE1, 1.5);
    CutKnockdown(1.0, oCopy, 6.5);
    CutSetLocation(1.0, oCopy);
    CutSetFacingPoint(1.0, oCultist1, "q3a_gong");
    CutSetFacingPoint(1.0, oCultist2, "q3a_gong");
    CutApplyEffectToObject(1.0, DURATION_TYPE_INSTANT, VFX_DUR_BIGBYS_CRUSHING_HAND, oCopy, 2.0);
    CutPlayVoiceChat(2.5, OBJECT_SELF, VOICE_CHAT_ATTACK);
    CutPlayAnimation(2.5, OBJECT_SELF, ANIMATION_LOOPING_TALK_FORCEFUL, 2.0);
    CutApplyEffectAtLocation(2.8, OBJECT_SELF, DURATION_TYPE_INSTANT, 472, GetLocation(OBJECT_SELF));
    CutJumpToObject(4.0, OBJECT_SELF, oArmandJump);
    CutActionMoveToObject(5.2, oCultist2, oCopy, TRUE);
    CutActionMoveToObject(5.5, oCultist1, oCopy, TRUE);
    CutPlayVoiceChat(5.5, oCultist1, VOICE_CHAT_BATTLECRY1);
    CutPlayVoiceChat(6.0, oCultist2, VOICE_CHAT_BATTLECRY2);
    CutFadeOutAndIn(7.0, oPC, 3.5);
    CutAdjustReputation(8.8, oPC, OBJECT_SELF, -100);
    CutAdjustReputation(8.8, OBJECT_SELF, oPC, -100);
    DelayCommand(11.0, AssignCommand(oCultist1, ActionAttack(oPC)));
    DelayCommand(11.0, AssignCommand(oCultist2, ActionAttack(oPC)));
    //CutActionAttack(9.9, oCultist1, oPC);
    //CutActionAttack(9.9, oCultist2, oPC);

    object oWP1 = GetNearestObjectByTag("q3a_wp_run1", oPC);
    int i = 1;
    object oSlave = GetNearestObjectByTag("Q3A_SLAVE", oPC, i);
    object oWP = GetNearestObjectByTag("q3a_wp_run", oSlave);
    float fDelay;
    int nRand;
    while(i <= 10)
    {
        fDelay += 0.7;
        nRand = Random(2);
        if(nRand == 0)
            DelayCommand(9.5 + fDelay, PlayVoiceChat(VOICE_CHAT_FLEE, oSlave));

        DelayCommand(9.0, AssignCommand(oSlave, ActionMoveToObject(oWP1, TRUE)));
        DelayCommand(12.0, AssignCommand(oSlave, ActionMoveToObject(oWP, TRUE)));
        DelayCommand(13.0, AssignCommand(oSlave, ActionMoveAwayFromObject(oGong, TRUE)));
        DelayCommand(20.0, AssignCommand(oSlave, SetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS, TRUE)));
        i++;
        oSlave = GetNearestObjectByTag("Q3A_SLAVE", oPC, i);
        oWP = GetNearestObjectByTag("q3a_wp_run", oSlave);
    }
    oSac = GetNearestObjectByTag("q3a_sacrifice");
    DelayCommand(9.0, AssignCommand(oSac, ActionMoveToObject(oWP1, TRUE)));
    DelayCommand(12.0, AssignCommand(oSac, ActionMoveToObject(oWP, TRUE)));
    DelayCommand(13.0, AssignCommand(oSac, ActionMoveAwayFromObject(oGong, TRUE)));

    CutDisableCutscene(CUTSCENE_NUMBER, 9.0, 9.0, RESTORE_TYPE_NORMAL);
}
