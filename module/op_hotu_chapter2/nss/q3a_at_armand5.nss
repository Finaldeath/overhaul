// Monks close on the woman and take her to the temple.

#include "x2_inc_cutscene"
#include "x0_i0_anims"

int CUTSCENE_NUMBER = 31;

void BringGnome(object oPC)
{
    // Cordigan appears and inits dialog
    object oWP = GetWaypointByTag("q3_wp_leader_sp");
    object oGnome = GetObjectByTag("q3_cordigan");
    SetLocalInt(oGnome, "STATUS", 1);
    SetCommandable(TRUE, oGnome);
    AssignCommand(oGnome, ClearAllActions());
    AssignCommand(oGnome, ActionJumpToObject(oWP));
    AssignCommand(oGnome, ActionStartConversation(oPC));
}

void main()
{
    object oPC = GetPCSpeaker();
    // evil hit
    if(GetAlignmentGoodEvil(oPC) == ALIGNMENT_GOOD)
        AdjustAlignment(oPC, ALIGNMENT_EVIL, 10);
    object oSac = GetNearestObjectByTag("q3a_sacrifice");
    object oCultist1 = GetNearestObjectByTag("q3a_cultist1");
    object oCultist2 = GetNearestObjectByTag("q3a_cultist2");
    object oMonkWP1 = GetWaypointByTag("q2a_wp_monk1");
    object oMonkWP2 = GetWaypointByTag("q2a_wp_monk2");
    object oDoor = GetNearestObjectByTag("q3a_TempleDoor");
    CutSetActiveCutscene(CUTSCENE_NUMBER, CUT_DELAY_TYPE_CONSTANT, FALSE);
    object oArmandJump = GetWaypointByTag("q3_wp_armand_sp");
    CutDisableAbort(CUTSCENE_NUMBER);
    CutActionMoveToObject(0.0, oCultist1, oSac, TRUE);
    CutActionMoveToObject(0.0, oCultist2, oSac, TRUE);
    CutActionMoveToObject(2.0, OBJECT_SELF, oDoor, FALSE);
    CutActionMoveToObject(2.5, oSac, oDoor, FALSE);
    CutActionMoveToObject(3.0, oCultist1, oDoor, FALSE);
    CutActionMoveToObject(3.0, oCultist2, oDoor, FALSE);

    CutFadeOutAndIn(7.0, oPC);

    CutClearAllActions(7.5, OBJECT_SELF, TRUE);
    CutClearAllActions(7.5, oCultist1, TRUE);
    CutClearAllActions(7.5, oCultist2, TRUE);
    CutJumpToObject(8.0, OBJECT_SELF, oArmandJump);
    CutJumpToLocation(8.0, oCultist1, GetLocation(oMonkWP1));
    CutJumpToLocation(8.0, oCultist2, GetLocation(oMonkWP2));
    CutDestroyObject(8.0, oSac);

    int i = 1;
    object oSlave = GetNearestObjectByTag("Q3A_SLAVE", oPC, i);
    while(i <= 10)
    {
        DelayCommand(9.0, AssignCommand(oSlave, SetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS, TRUE)));
        i++;
        oSlave = GetNearestObjectByTag("Q3A_SLAVE", oPC, i);
    }


    CutDisableCutscene(CUTSCENE_NUMBER, 9.0, 9.0, RESTORE_TYPE_COPY);

    DelayCommand(9.0, BringGnome(oPC));
}
