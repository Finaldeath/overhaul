// Updates the PC's journal entry and quest variables
// for the object being spoken to

#include "help_hench"

void main()
{
    //Launch cutscene mode
    object oPC = GetPCSpeaker();
    SetCutsceneMode(oPC, TRUE);

    //Unlock the desk
    object oDesk = GetNearestObjectByTag("PLAC_VARH_DESK");
    SetPlotFlag(oDesk, FALSE);
    SetLocked(oDesk, FALSE);

    //Open the door
    object oDoor = GetNearestObjectByTag("DOOR_VARH_CHAMB");
    SetLocked(oDoor, FALSE);
    AssignCommand(oDoor, ActionOpenDoor(OBJECT_SELF));

    //Jump Varhun to his desk in case he's elsewhere.
    object oVarhun = GetNearestObjectByTag("CT_UNIQ_SH_VARH");
    AssignCommand(oVarhun, JumpToObject(oDesk));

    //Walk the player to Varhun (and adjust their alignment)
    AssignCommand(oPC, ClearAllActions(TRUE));
    AssignCommand(oPC, ActionForceMoveToObject(oVarhun));
    AdjustAlignment(oPC, ALIGNMENT_LAWFUL, 5);

    //Walk Anagril to Varhun
    ClearAllActions(TRUE);
    ActionForceMoveToObject(oVarhun);

    //Launch the conv and remove the cutscene when the walk command is complete.
    AssignCommand(oPC, ActionDoCommand(AssignCommand(oVarhun, ActionStartConversation(oPC))));
    AssignCommand(oPC, ActionDoCommand(SetCutsceneMode(oPC, FALSE)));
}
