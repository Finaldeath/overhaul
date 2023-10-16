// Armand leaves the area and the cutscene ends

int CUTSCENE_NUMBER = 31;

#include "x2_inc_cutscene"

void main()
{
    object oPC = GetFirstPC();
    object oCopyJump = GetWaypointByTag("q3b_wp_cutjump");
    object oArmandJump = GetWaypointByTag("q3b_wp_cutjump1");
    object oCultist1Jump = GetWaypointByTag("q3b_wp_cutjump2");
    object oCultist2Jump = GetWaypointByTag("q3b_wp_cutjump3");
    object oCopy = GetLocalObject(oPC, "q2a_copy");
    object oExit = GetWaypointByTag("q3a_wp_armand_exit");
    object oSP = GetWaypointByTag("q3_wp_armand_sp");
    // cutscene 31 is still active.
    CutDisableAbort(CUTSCENE_NUMBER);
    CutSetActiveCutscene(CUTSCENE_NUMBER, CUT_DELAY_TYPE_CONSTANT, FALSE);
    object oCultist1 = GetNearestObjectByTag("q3a_cultist1");
    object oCultist2 = GetNearestObjectByTag("q3a_cultist2");
    object oDoor = GetObjectByTag("q3a_TempleDoor");
    SetLocked(oDoor, FALSE);
    AssignCommand(oDoor, ActionOpenDoor(oDoor));

    CutActionMoveToObject(0.0, OBJECT_SELF, oExit, FALSE);
    CutJumpToObject(5.0, OBJECT_SELF, oSP);
    CutClearAllActions(5.5, OBJECT_SELF, TRUE);
    CutFadeOutAndIn(6.0, oPC, 3.0);
    CutAdjustReputation(6.9, oPC, oCultist1, -100);
    CutAdjustReputation(6.9, oCultist1, oPC, -100);
    CutJumpToObject(7.0, oPC, oCopyJump);
    CutSetLocation(7.1, oPC);
    CutDisableCutscene(CUTSCENE_NUMBER, 7.2, 7.2, RESTORE_TYPE_NORMAL);
    // Bring associates to the fight
    object oAnimal = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
    object oDominated = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC);
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    object oSummoned = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC);
    DelayCommand(12.2, AssignCommand(oAnimal, ActionForceMoveToObject(oPC)));
    DelayCommand(12.2, AssignCommand(oDominated, ActionForceMoveToObject(oPC)));
    DelayCommand(12.2, AssignCommand(oFamiliar, ActionForceMoveToObject(oPC)));
    DelayCommand(12.2, AssignCommand(oSummoned, ActionForceMoveToObject(oPC)));

    int i = 1;
    object oHenchman = GetHenchman(oPC, i);
    while(oHenchman != OBJECT_INVALID)
    {
        DelayCommand(12.2, AssignCommand(oHenchman, ActionForceMoveToObject(oPC, TRUE, 5.0)));
        i++;
        oHenchman = GetHenchman(oPC, i);
    }
}
