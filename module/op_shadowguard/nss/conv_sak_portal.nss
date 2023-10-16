#include "help_general"

void main()
{
    object oPC = GetPCSpeaker();

    object oWP = GetNearestObjectByTag("WP_SAKARA_PORTAL_RETURN", oPC);

    location lWP = GetLocation(oWP);

    FadeToBlack(oPC, FADE_SPEED_FASTEST);

    DelayCommand(3.0, AssignCommand(oPC, JumpToLocation(lWP)));

    DelayCommand(3.5, FadeFromBlack(oPC, FADE_SPEED_FASTEST));

    DelayCommand(3.5, SceneSpeak(oPC, "[It seems Sakara's portal has taken you back to the main hall of the Chambers of Rakha...]"));
}
