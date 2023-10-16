#include "help_hench"

void main()
{
    object oPC = GetFirstPC();
    object oJanthos = GetNearestObjectByTag("SGCUT_JANTHOS", oPC);
    object oGilles = GetNearestObjectByTag("CT_UNIQ_NT_MESS", oPC);

    SetCutsceneMode(oPC, TRUE);
    AddJournalSingle("JT_ST_0_MAIN", 1, oPC);

    DelayCommand(0.5, AssignCommand(oPC, SetCameraFacing(300.0f, 8.0f, 60.0f,
        CAMERA_TRANSITION_TYPE_MEDIUM)));

    DelayCommand(1.0, AssignCommand(oGilles, ActionStartConversation(oPC)));

}
