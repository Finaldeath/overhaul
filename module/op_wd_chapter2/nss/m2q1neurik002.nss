#include "m2_i0_plot"

void main()
{
    SetPartyLocalInt(GetPCSpeaker(), "NW_L_M2Q1A02NEURIK_PLOT", 20);
    SetLocalInt(OBJECT_SELF, "NW_L_NEURIK_PLOT_STARTED",1);
    CreateItemOnObject("M2Q1SILVERCHARM",GetPCSpeaker());
    CreateItemOnObject("M2Q1SILVERCHARM",GetPCSpeaker());
    CreateItemOnObject("M2Q1SILVERCHARM",GetPCSpeaker());
    CreateItemOnObject("M2Q1SILVERCHARM",GetPCSpeaker());

    CreateObject(OBJECT_TYPE_CREATURE,"M2Q1CURTH",GetLocation(GetWaypointByTag("WP_URTH")));
    CreateObject(OBJECT_TYPE_CREATURE,"M2Q1CBRAN",GetLocation(GetWaypointByTag("WP_BRAN")));
    CreateObject(OBJECT_TYPE_CREATURE,"M2Q1CGETH",GetLocation(GetWaypointByTag("WP_GETH")));
    AssignCommand(GetObjectByTag("M2Q1URTHDOOR"),SetLocked(OBJECT_SELF,FALSE));
}
