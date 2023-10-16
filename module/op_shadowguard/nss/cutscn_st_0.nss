#include "help_hench"

int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetCutsceneStage(oPC) != 0)
        return FALSE;

    return TRUE;
}
