#include "help_doors"
#include "help_general"
#include "help_hench"

void main()
{
    object oPC = GetClickingObject();

    if (GetJournalQuestState("JT_ST_1_MAIN", oPC) < 10)
        SceneSpeak(oPC, "[You should speak with each of the ShadowGuard before heading into the Market District...]");

    else
    {
        object oDoor = OBJECT_SELF;

        oDoor = DoorAreaTransition(oDoor);

        AssignCommand(GetClickingObject(), JumpToObject(oDoor));
    }
}
