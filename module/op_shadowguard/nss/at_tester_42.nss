#include "help_hench"

void main()
{
    string sHench = "HENCH_KARA";

    object oPC = GetPCSpeaker();

    SpawnHenchman(oPC, sHench);
}
