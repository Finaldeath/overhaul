#include "help_hench"

int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetCutsceneStage(oPC) != 2)
        return FALSE;

    return TRUE;
}
