#include "help_general"

void main()
{
    object oPC = GetPCSpeaker();

    object oHench = GetHenchman(oPC);

    if (GetTag(oHench) == "HENCH_BRUK")
    {
        RemoveHenchman(oPC, oHench);

        AssignCommand(oHench, ClearAllActions(TRUE));
        AssignCommand(oHench, ActionMoveToObject(GetNearestObjectByTag("WP_EXIT", oHench), TRUE));

        SetLocalInt(oHench, "N_DONT_SPEAK", 1);

        DestroyObject(oHench, 4.0);
    }
}
