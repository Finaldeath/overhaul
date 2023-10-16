#include "help_hench"

void main()
{
    string sHench = "HENCH_TARI";

    object oPC = GetPCSpeaker();

    SpawnHenchman(oPC, sHench);
}
