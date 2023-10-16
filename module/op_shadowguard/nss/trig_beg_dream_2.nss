#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetLocalInt(OBJECT_SELF, "N_DO_ONCE") == 0)
        {
            SceneSpeak(oPC, "[You vividly remember your horror as you came upon the scene of your father and mother, brutally cut to pieces by the savage followers of the Crimson Prophet...]");

            object o1 = GetNearestObjectByTag("CT_COMM_CF_FOLL", oPC, 1);
            object o2 = GetNearestObjectByTag("CT_COMM_CF_FOLL", oPC, 2);

            DelayCommand(4.5, SceneSpeak(o1, "[One of the fanatical barbarians looks towards you, his eyes burning with maniacal fervor.]  Looks like we've found ourselves another Imperial whelp!"));

            AssignCommand(o1, DelayCommand(6.0, ActionStartConversation(oPC)));
            AssignCommand(o2, DelayCommand(6.0, ActionMoveToObject(oPC)));

            SetLocalInt(OBJECT_SELF, "N_DO_ONCE", 1);
        }
    }
}
