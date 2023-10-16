#include "help_hench"

void main()
{
    object oPC = GetPCSpeaker();

    FadeFromBlack(oPC, FADE_SPEED_FAST);
    InitializeCutscene(oPC, FALSE, FALSE, FALSE);
}
