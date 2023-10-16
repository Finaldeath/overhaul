#include "help_hench"

void main()
{
    string sHench = "HENCH_BRUK";

    object oPC = GetPCSpeaker();

    SpawnHenchman(oPC, sHench);
}
