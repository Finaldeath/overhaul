#include "help_general"

void main()
{
    object oVarhun = GetNearestObjectByTag("CT_UNIQ_SH_VARH");

    if (GetDistanceBetween(OBJECT_SELF, oVarhun) <= 5.0 && GetPlotFlag(OBJECT_SELF) == TRUE)
    {
        SceneSpeak(oVarhun, "[Chancellor Varhun slams the drawer to his desk closed, waving his fists angrily.]  You stay out of that now!  Those are my belongings, and I'll not have you pilfering through them!!");

        SetLocked(OBJECT_SELF, TRUE);
    }
}
