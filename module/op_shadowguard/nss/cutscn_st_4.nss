#include "help_hench"

int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetCutsceneStage(oPC) != 4)
        return FALSE;

    return TRUE;
}
