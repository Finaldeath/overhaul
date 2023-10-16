#include "help_hench"

void main()
{
    object oPC = GetPCSpeaker();

    FadeToBlack(oPC, FADE_SPEED_FASTEST);

    AssignCommand(oPC, DelayCommand(1.0, BeginCutscene(oPC, GetLocalString(oPC, "S_CURR_CUTSCENE"))));

    AssignCommand(oPC, DelayCommand(1.2, ActionPauseConversation()));

    AssignCommand(oPC, DelayCommand(3.0, ActionResumeConversation()));
}
