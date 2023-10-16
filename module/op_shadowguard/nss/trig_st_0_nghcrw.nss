#include "help_general"
#include "help_hench"
void main()
{
    object oPC = GetEnteringObject();

    if (GetJournalQuestState("JT_PREL_TARI", oPC) >= 10)
    {
        if (GetFirstTimeIn())
        {
            object oMalt = GetNearestObjectByTag("CT_UNIQ_PH_MALT", oPC);

            object oTrapDoor = GetNearestObjectByTag("PLAC_TRDR_ST_0_NC_LAIR", oPC);

            SceneSpeak(oMalt, "Curse it all! That lazy Halgok still hasn't arrived! If I lose my prize due to his ineptitude, I'll have his head!");

            AssignCommand(oMalt, ActionMoveToObject(oTrapDoor, TRUE));
            SetLocked(oTrapDoor, FALSE);

            AssignCommand(oMalt, SetIsDestroyable(TRUE, FALSE, FALSE));
            AssignCommand(GetModule(), DestroyObject(oMalt, 2.5));

            DelayCommand(2.5, AssignCommand(oTrapDoor, PlayAnimation(ANIMATION_PLACEABLE_OPEN)));
            DelayCommand(3.0, AssignCommand(oTrapDoor, PlayAnimation(ANIMATION_PLACEABLE_CLOSE)));

            AddJournalSingle("JT_PREL_TARI", 12, oPC);
        }
    }
}
