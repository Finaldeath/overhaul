// Updates the PC's journal entry and quest variables
// for the object being spoken to

#include "help_general"
#include "help_hench"

void main()
{
    string s = GetJournalQuest(GetTag(OBJECT_SELF));;

    AddJournalSingle(s, 5, GetPCSpeaker());

    object oHarkon = GetNearestObjectByTag("CT_UNIQ_SH_HARK");

    object oWP = GetNearestObjectByTag("WP_AFTER_CP_WALK_TO", oHarkon);
    location lWP = GetLocation(oWP);

    SetLocalInt(oHarkon, "N_DONT_SPEAK", 1);
    AssignCommand(oHarkon, ActionMoveToLocation(lWP));

    int j;

    float f = 1.0;

    for (j = 0; j < 12; j++)
        DelayCommand(f * j, AssignCommand(oHarkon, ActionMoveToLocation(lWP, TRUE)));

    DestroyObject(oHarkon, 12.0);

    object o = GetFirstObjectInArea();

    while (o != OBJECT_INVALID)
    {
        if (GetTag(o) == "CT_COMM_NT_GHCM")
            SetLocalInt(o, "N_DONT_RAND", 0);

        o = GetNextObjectInArea();
    }

    //End the cutscene
    EndCutscene(GetPCSpeaker());

    //Set a variable to declare the cutscene complete.
    SetLocalInt(GetArea(OBJECT_SELF), "bCP_CutsceneComplete", TRUE);
}
