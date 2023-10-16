#include "nw_i0_plot"

void main()
{
    location lSpirit = GetLocation(GetWaypointByTag("WP_M2Q2SPIRITWOOD"));
    object oPC = GetLastPlayerDied();

        if ((GetTag(GetArea(oPC)) == "MAP_M2Q2F") && (GetDistanceBetweenLocations(GetLocation(oPC), lSpirit) < 5.0))
        {
            SpeakString("Teleport");
            ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectResurrection(),oPC);
            AssignCommand(oPC,ActionJumpToObject(GetWaypointByTag("WP_M2Q2GtoM2Q2F")));
        }
}
