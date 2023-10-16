#include "help_hench"

void main()
{
    object oPC = GetFirstPC();

    if (GetArea(oPC) == OBJECT_SELF && GetJournalQuestState("JT_GRAD_TEST", oPC) < 14)
    {
        int i = GetLocalInt(GetModule(), "N_START_LAB_TIMER");

        i++;

        SetLocalInt(GetModule(), "N_START_LAB_TIMER", i);

        object o = GetFirstObjectInArea();

        while (o != OBJECT_INVALID)
        {
            if (GetStringLeft(GetTag(o), 6) == "HENCH_")
            {
                if (GetJournalQuestState("JT_GRAD_TEST", oPC) >= 6 && GetLocalInt(OBJECT_SELF, "N_DO_INC_1_" + GetTag(o) + "_ONCE") == 0)
                {
                    IncrementHenchAreaCounter(OBJECT_SELF, GetTag(o));

                    SetLocalInt(OBJECT_SELF, "N_DO_INC_1_" + GetTag(o) + "_ONCE", 1);
                }

                MoveHenchman_Area(OBJECT_SELF, GetTag(o));
            }

            o = GetNextObjectInArea();
        }
    }
}
