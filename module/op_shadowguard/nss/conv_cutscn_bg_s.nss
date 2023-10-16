#include "help_hench"

void main()
{
    object oPC = GetPCSpeaker();

    FadeToBlack(oPC, FADE_SPEED_FASTEST);

    InitializeCutscene(oPC, FALSE, FALSE, FALSE);
}
