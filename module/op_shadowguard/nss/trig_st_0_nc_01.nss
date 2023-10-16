#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetFirstTimeIn() && GetAbilityScore(oPC, ABILITY_INTELLIGENCE) >= 12)
        {
            SceneSpeak(oPC, "[Intelligence]  [It occurs to you that it might be possible to lock the fence gates, thereby preventing the Nightcrawler gang members from coming to each other's aid...]");
        }

        object o = GetNearestObjectByTag("CT_COMM_PH_MAN0");

        if (GetReputation(o, oPC) > 10)
            SceneSpeak(o, "Don't try to pull anything foolish in here, or we'll slit yer throat!");
    }
}
