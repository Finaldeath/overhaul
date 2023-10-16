#include "help_hench"

void main()
{
    string sHench = "HENCH_LYEN";

    object oPC = GetPCSpeaker();

    SpawnHenchman(oPC, sHench);
}
