#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetFirstTimeIn())
        {
            SceneSpeak(oPC, "[The Isle of Azakhal lies before you, a place known throughout the Sharakhan Empire as a safe haven for fugitives and murderers hiding from justice...]");

            object oGnomishContrap = GetNearestObjectByTag("PLAC_ST_2_LY_GN_CNTRP", oPC);

            SetImmortal(oGnomishContrap, TRUE);
        }
    }
}
