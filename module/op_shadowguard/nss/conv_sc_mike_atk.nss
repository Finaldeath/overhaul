#include "help_general"
#include "help_hench"

void main()
{
    object oPC = GetPCSpeaker();

    AdjustReputation(oPC, OBJECT_SELF, -100);

    AddJournalSingle("JT_PREL_MARK", 4, oPC);

    object o = GetFirstObjectInArea();

    SceneSpeak(OBJECT_SELF, "You will die by my hand, " + GetName(oPC) + "!");

    while (o != OBJECT_INVALID)
    {
        if (GetFactionEqual(o, OBJECT_SELF))
            AssignCommand(o, ActionAttack(oPC));

        o = GetNextObjectInArea();
    }
}
