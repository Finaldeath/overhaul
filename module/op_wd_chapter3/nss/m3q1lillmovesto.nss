//::///////////////////////////////////////////////
//:: Lillian moves upstairs
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Lillian moves upstairs to put the
    snowglobe on the pedestal.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    SpeakString("I SHOULD EVENTUALLY WALK THERE IF THAT SYSTEM EVER WORKS");

    ActionJumpToObject(GetObjectByTag("M3Q1A11B_LILLWALKTO"));
    SetLocalInt(GetModule(),"NW_G_M3Q01PLOTGLOBEONPEDESTAL",1);
    CreateObject(OBJECT_TYPE_PLACEABLE,"M3Q1SNOWGLOBESPA",GetLocation(GetObjectByTag("M3Q1SNOWGLOBE")));

}
