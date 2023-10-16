//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Give Cloak to PC. Give XP to PC.
     Set that pc reported job done.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: August 6, 2003
//:://////////////////////////////////////////////
void main()
{
    object oEnivid = GetObjectByTag("q2_enivid");
    object oCloak = (GetObjectByTag("q2_cloakofspider"));
    GiveXPToCreature(GetFirstPC(),1000);
    CreateItemOnObject("q2_cloakofspider",GetFirstPC());
    SetLocalInt(GetFirstPC(),"os_freeprisoner",99);
    SetLocalInt(oEnivid,"OS_ENIVID_STILETTO",30);
}
