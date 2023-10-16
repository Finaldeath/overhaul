//::///////////////////////////////////////////////
//:: M3Q2StartTheWar.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////


void main()
{
    if ((GetIsPC(GetEnteringObject()) == TRUE)
        && (GetLocalInt(OBJECT_SELF,"NW_L_DOONCE") == 0))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "M3Q2A05_PULTCOM", GetLocation(GetObjectByTag("POST_M3Q2A05_PULTCOM")));

        CreateObject(OBJECT_TYPE_CREATURE, "M3Q2A05_PULTCOM2", GetLocation(GetObjectByTag("POST_M3Q2A05_PULTCOM2")));
        CreateObject(OBJECT_TYPE_CREATURE, "M3Q2A05_PULTCOM3", GetLocation(GetObjectByTag("POST_M3Q2A05_PULTCOM3")));
        CreateObject(OBJECT_TYPE_CREATURE, "M3Q2A05_PULTC004", GetLocation(GetObjectByTag("POST_M3Q2A05_PULTCOM4")));
        CreateObject(OBJECT_TYPE_CREATURE, "M3Q2A05_PULTC005", GetLocation(GetObjectByTag("POST_M3Q2A05_PULTCOM5")));
        CreateObject(OBJECT_TYPE_CREATURE, "M3Q2A05_PULTC006", GetLocation(GetObjectByTag("POST_M3Q2A05_PULTCOM6")));
        SetLocalInt(OBJECT_SELF,"NW_L_DOONCE",1);
    }

}
