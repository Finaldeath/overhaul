// Updates the PC's journal entry and quest variables
// for the object being spoken to

#include "help_hench"

void main()
{
    string s = GetJournalQuest(GetTag(OBJECT_SELF));;
    object oPC = GetPCSpeaker();
    AddJournalSingle(s, 4, GetPCSpeaker());


    SetLocalInt(OBJECT_SELF, "N_DONT_SPEAK", 1);
    AssignCommand(OBJECT_SELF, ActionMoveAwayFromObject(oPC, TRUE));

    //End the cutscene.
    SetCutsceneMode(oPC, FALSE);

    AssignCommand(oPC, SetCameraFacing(230.0f, 8.0f, 65.0f, CAMERA_TRANSITION_TYPE_SNAP));
    DestroyObject(OBJECT_SELF, 5.0);

}
