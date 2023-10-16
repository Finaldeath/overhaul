#include "help_hench"

int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetCutsceneStage(oPC) != 6)
        return FALSE;

    return TRUE;
}
