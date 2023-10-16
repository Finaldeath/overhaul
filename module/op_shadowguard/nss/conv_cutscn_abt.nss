#include "help_hench"

void main()
{
    object oPC = GetPCSpeaker();

    // Restart Conversation
    BeginCutscene(oPC, GetLocalString(oPC, "S_CURR_CUTSCENE" ));
}
