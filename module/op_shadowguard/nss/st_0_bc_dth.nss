#include "help_hench"

// DUE TO FACT THAT SCRIPTS WERE DRIVING ME CRAZY!!
// CUSTOM DEATH SCRIPT!!

void main()
{
    object oAltar = GetLocalObject(OBJECT_SELF, "O_ALTAR");

    if (oAltar != OBJECT_INVALID)
        SetIsDestroyable(FALSE);

    else
    {
        SetIsDestroyable(TRUE);

        int i = GetLocalInt(GetModule(), "N_BATT_CONS_KILLED");

        i++;

        SetLocalInt(GetModule(), "N_BATT_CONS_KILLED", i);

        if (i == 4)
            AddJournalSingle("JT_GRAD_TEST", 10, GetFirstPC());
    }
}
