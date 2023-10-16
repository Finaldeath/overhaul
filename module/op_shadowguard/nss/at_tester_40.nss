#include "help_hench"

void main()
{
    string sHench = "HENCH_MARK";

    object oPC = GetPCSpeaker();

    SpawnHenchman(oPC, sHench);
}
