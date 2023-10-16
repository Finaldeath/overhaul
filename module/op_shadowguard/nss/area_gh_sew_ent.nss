#include "help_general"
#include "help_hench"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetJournalQuestState("JT_PREL_LYEN", oPC) >= 9)
        {
            object oTrapDoor = GetNearestObjectByTag("TP_DR_BH_LAIR", oPC);

            SetLocked(oTrapDoor, FALSE);

            AssignCommand(oTrapDoor, PlayAnimation(ANIMATION_PLACEABLE_OPEN));

            object oHench = GetHenchman(oPC);

            if (GetTag(oHench) == "HENCH_LYEN")
            {
                DoSinglePlayerAutoSave();

                RemoveHenchman(oPC, oHench);
                AddJournalSingle("JT_PREL_LYEN", 10, oPC);

                //SceneSpeak(oHench, "It seems our paths must now part...");
                AssignCommand(oHench, ClearAllActions(TRUE));
                AssignCommand(oPC, ClearAllActions(TRUE));
                AssignCommand(oHench, ActionStartConversation(oPC));
            }
        }
    }
}
