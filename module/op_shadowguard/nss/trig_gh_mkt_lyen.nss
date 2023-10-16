#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetLocalInt(OBJECT_SELF, "N_DO_ONCE") == 0)
        {
            object oLyen = GetNearestObjectByTag("HENCH_LYEN", oPC);

            SceneSpeak(oLyen, "Excuse me, but might I have a word with you for a moment?");

            SetLocalInt(OBJECT_SELF, "N_DO_ONCE", 1);
        }
    }
}
