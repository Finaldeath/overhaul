//::///////////////////////////////////////////////
//:: Name q2c_use_rakport
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Jump the Pc to the other end of the Rakshasa
    Portal.
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  July 4
//:://////////////////////////////////////////////

void main()
{
    string szDest = "wp_q2crakportal2";


    object oPC = GetLastUsedBy();
    //Play Portal Activation Sound
    AssignCommand(oPC, PlaySound("gui_dm_drop"));
    //Play VisualEffect

    location lDest = GetLocation(GetObjectByTag(szDest));
    DelayCommand(0.5, AssignCommand(oPC, JumpToLocation(lDest)));



}
