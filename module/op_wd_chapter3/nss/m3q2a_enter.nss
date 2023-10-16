//::///////////////////////////////////////////////
//:: M3Q2A_ENTER
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Autosaves the game on entering the area.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    April 2002
//:://////////////////////////////////////////////

void main()
{
    if(GetLocalInt(GetModule(),"NW_G_M3Q2A_AUTOSAVE")==0
        && GetIsPC(GetEnteringObject()))
    {
        DoSinglePlayerAutoSave();
        SetLocalInt(GetModule(),"NW_G_M3Q2A_AUTOSAVE",1);
    }
    // * If the siege is over, play a different background ambient
    if (GetLocalInt(GetModule(), "NW_G_SIEGEOVER") == 100 && GetLocalInt(OBJECT_SELF, "NW_L_MYMUSICOFF") == 0)
    {
        AmbientSoundChangeDay(OBJECT_SELF, 49);
        AmbientSoundChangeNight(OBJECT_SELF, 53);
        SetLocalInt(OBJECT_SELF, "NW_L_MYMUSICOFF", 10);
    }
}
