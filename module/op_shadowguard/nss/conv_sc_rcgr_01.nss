#include "help_hench"

void main()
{
    object oPC = GetPCSpeaker();

    AddJournalSingle("JT_PREL_MARK", 4, oPC);

    AdjustReputation(oPC, OBJECT_SELF, -100);

    AssignCommand(OBJECT_SELF, ActionAttack(oPC));
}
