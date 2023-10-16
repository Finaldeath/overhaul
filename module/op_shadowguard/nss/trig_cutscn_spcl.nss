#include "help_general"
#include "help_hench"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPossessedFamiliar(oPC))
    {
        UnpossessFamiliar(oPC);
    }
    else if (GetIsPC(oPC))
    {
        if (GetFirstTimeIn())
        {
            BlackScreen(oPC);
            BeginCutscene(oPC, "sc_st_1_cp_confr");
        }
    }
}
