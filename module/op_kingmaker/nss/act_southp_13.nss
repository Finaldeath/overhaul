//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Mark PC has upset Southpaw and Stiletto reported
     dead.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: July 24, 2003
//:://////////////////////////////////////////////
void main()
{
    SetLocalInt(GetFirstPC(),"os_southpawmet",2);
    SetLocalInt(GetFirstPC(),"os_freeprisoner",99);
}
