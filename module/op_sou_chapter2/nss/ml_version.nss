//::///////////////////////////////////////////////
//:: Version Number (OnModuleLoad)
//:: ML_Version.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Set the version control variable.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 15, 2003
//:://////////////////////////////////////////////

void main()
{
    //Defines the latest version number & date
    SetLocalString(GetModule(),"NW_S_VERSION", "1.118 [May 26]");
}
