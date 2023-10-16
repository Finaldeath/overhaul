#include "help_hench"

int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetCutsceneStage(oPC) != 1)
        return FALSE;

    return TRUE;
}
