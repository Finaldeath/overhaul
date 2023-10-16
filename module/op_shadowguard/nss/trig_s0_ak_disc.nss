#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        object oGhas = GetNearestObjectByTag("CT_UNIQ_AK_GHAS", oPC);
        if (GetArea(oPC) == GetArea(oGhas))
        {
            int bDoOnce = GetFirstTimeIn();
            if (bDoOnce == FALSE)
            {
//            SceneSpeak(oPC, "[You notice three strangely garbed men standing ahead of you, and the mere sight of them sends shivers down your spine...]");

                string sGender;

                if (GetGender(oPC) == GENDER_MALE)
                    sGender = "sir";

                else
                    sGender = "madam";

                DelayCommand(4.0, SceneSpeak(oGhas, "Excuse me, " + sGender + ", but might my companions and I have a moment of your time?"));
            }
        }
    }
}
