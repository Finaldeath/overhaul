//::///////////////////////////////////////////////
//:: M3Q03D08ZOKAEGB1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  - Set on the module the person who cured the plague
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

#include "m3plotinclude"

void DestroyNPC(string sTag)
{
    if(GetIsObjectValid(GetObjectByTag(sTag)))
    {
        DestroyObject(GetObjectByTag(sTag));
        DelayCommand(1.0,DestroyNPC(sTag));
    }
}
void main()
{
    SetLocalObject(GetModule(),"NW_L_M3Q03TALKPLAGUECUREPC",GetPCSpeaker());
    SetLocked(GetObjectByTag("Eckelshomestead"),FALSE);
    SetCustomToken(201,GetName(GetPCSpeaker()));
    SetLocalInt(GetModule(),"NW_G_M3Q03PLOTPLAGUECURED",1);
    SetAllElkTribePeaceful(GetPCSpeaker());
    SetAllElkTribePeaceful(GetObjectByTag("M3Q2D_FORTFACGOOD"));
    DestroyNPC("SCAREDMERC3Q022");
    DestroyNPC("ScaredMerc3Q21");
    DestroyNPC("M3Q2A10_ALLY");
    DestroyNPC("M3Q2C06DOORBREAKER");
    DestroyNPC("M3Q2A05_PULTCOM");
    DestroyNPC("M3Q2A05_PULTCOM2");
    DestroyNPC("M3Q2A05_PULTCOM3");
    DestroyNPC("M3Q2A05_PULTCOM4");
    DestroyNPC("M3Q2A05_PULTCOM5");
    DestroyNPC("M3Q2A05_PULTCOM6");
}
